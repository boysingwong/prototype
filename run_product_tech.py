# -*- coding: utf-8 -*- 
import codecs
import MySQLdb
import re
import sys
from warnings import filterwarnings


def search_product_tech(doc_id):
	filterwarnings('ignore', category=MySQLdb.Warning)
	sys.stdout = codecs.getwriter('utf8')(sys.stdout)
	try:
		mysql = MySQLdb.connect(user='root', passwd='password1', db='scin_db', host='127.0.0.1', port=3306,
								autocommit='True', charset='utf8', use_unicode=True)
		mysql_cursor = mysql.cursor()

		# call search protein keywords
		args = [doc_id]
		mysql_cursor.callproc('scin_db.pub_technique_product_exists', args)

		query = (
			"SELECT figure_id, si_id, tech_id, technique_group, tech_parental_name, tech_alternative, prod_id, supplier, catalog_nb, prod_name_id, product_name, content FROM scin_db.pub_tech_prod_temp")
		mysql_cursor.execute(query)

		rsltCount = 0
		for (
				figure_id, si_id, tech_id, technique_group, tech_parental_name, tech_alternative, prod_id, supplier, catalog_nb,
				prod_name_id, product_name, content) in mysql_cursor:
			# outputStr = "result: %s, %s, %s, %d, %d " % (tech_parental_name, tech_alternative, product_name, figure_id, si_id)

			# print "process figure#: %d " % figure_id

			# remove "-" from product_name
			product_name_temp = product_name.replace("(", "")
			product_name_temp = product_name.replace(")", "")
			product_name_temp = product_name.replace("-", "")

			sentenceList = re.split(ur'(?<!\w\.\w.)(?<![A-Z]\.)(?<=\.|\?)\s', content)
			for sentence in sentenceList:
				technique_exists = False
				protein_exists = False

				# print "process sentence [%s]" % sentence

				# a. check tech_alternative exists
				pattern = ur'(?i)\b%s\b' % (tech_alternative)
				if re.search(pattern, sentence):
					# print "tech_alternative found [%s]" % tech_alternative
					technique_exists = True
				else:
					continue

				# b. check protein exists:
				wordList = re.split('\s', sentence)

				for word in wordList:
					if len(word) < 3:
						continue

					# remove (, )
					word = word.replace("(", "")
					word = word.replace(")", "")

					# convert greek alphabet
					word = word.replace(u"α", "a")
					word = word.replace(u"β", "b")
					word = word.replace(u"γ", "g")
					word = word.replace(u"δ", "d")
					word = word.replace(u"ε", "e")

					# split words
					subwordList = re.split('-', word)
					subwordList.append(word.replace("-", ""))

					for subword in subwordList:
						if len(subword) < 3:
							continue

						if subword.lower() == product_name_temp.lower():
							# print "product_name_temp found exact match [%s]" % product_name_temp (non-case sensitive )
							protein_exists = True
						elif product_name_temp.lower().startswith(
								subword.lower()) or product_name_temp.lower().endswith(subword.lower()):
							# 2 way search #1
							protein_exists = True
						elif subword.lower().startswith(product_name_temp.lower()) or subword.lower().endswith(
								product_name_temp.lower()):
							# 2 way search #2
							protein_exists = True
						else:
							continue

				if technique_exists and protein_exists:
					rating = getRating(mysql_cursor, sentence, doc_id)
					insertStmt = ("INSERT INTO scin_db.pub_tech_prod_result "
								  "(doc_id, figure_id, si_id, tech_id, technique_group, tech_parental_name, tech_alternative, prod_id, supplier, catalog_nb, prod_name_id, product_name, sentence, rating) "
								  "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)")
					mysql_cursor.execute(insertStmt, (
						doc_id, figure_id, si_id, tech_id, technique_group, tech_parental_name, tech_alternative, prod_id,
						supplier, catalog_nb, prod_name_id, product_name, sentence, rating))
					mysql.commit()

					rsltCount = rsltCount + 1

		mysql_cursor.close()
		mysql.close()

		return rsltCount

	except MySQLdb.Error, e:
		errmsg = "MySQL Error (@%s) %d:  %s" % (doc_id, e.args[0], e.args[1])
		with open("error.log", 'w') as w:
			w.write(errmsg)
		sys.exit(1)


# TODO: 1. review structure technique_result and technique_list related tables
def getRating(mysql_cursor, sentence, doc_id):
	rating = 0
	techGroupSet = set()
	productSet = set()

	searchStmt = ("SELECT DISTINCT pn_tab.name as prod_name "
				  "FROM scin_db.pub_product_name pn_tab "
				  "INNER JOIN scin_db.pub_product_result pr_tab "
				  "ON pn_tab.prod_id = pr_tab.prod_id "
				  "WHERE pr_tab.doc_id = %s")
	mysql_cursor.execute(searchStmt, (doc_id))
	for (prod_name) in mysql_cursor:
		productSet.add(prod_name)

	# Rules 1: check sentence with different keyword of different parent (eg.IP + WB)
	searchStmt = (
		"select technique_group, tech_parental_name, tech_alternative from scin_db.pub_technique_result where doc_id = %s")
	mysql_cursor.execute(searchStmt, (doc_id))

	for (technique_group, tech_parental_name, tech_alternative) in mysql_cursor:
		pattern = ur'(?i)\b%s\b' % (tech_alternative)
		if re.search(pattern, sentence):
			techGroupSet.add(technique_group)

	if (len(techGroupSet) > 1 or len(techGroupSet) <= 0):
		rating = rating - 1

	# Rule 2: keywords pattern exceptions
	parentTech = list(techGroupSet)[0]

	# 2a: a. Immuno-Precipitation or Western Blotting
	if parentTech.lower() == "Immunoprecipitation".lower() or parentTech.lower() == "Western blot".lower():
		rankDownList = ["flag", "Flag", "HA", "his", "His", "myc", "Myc", "gst", "Gst", 
						"V5", "biotin", "Biotin", "glutathione-sepharose", "Glutathione-sepharose", "Tagged"]

		for rankDownItem in rankDownList:
			if rankDownItem in sentence:
				# TODO: implement exception
				rating = rating - 1

	# 2b: a. Immuno-Staining
	if parentTech.lower() == "Immunostaining".lower():
		rankDownList = ["phaollodin", "Phaollodin", "annexin V", "Annexin V", "phase contrast", "Phase contrast", 
						"H&E", "hoechst", "Hoechst", "DAPI", "tunel", "Tunel", "haematoxylin", "Haematoxylin", 
						"prodpidium iodine", "Prodpidium iodine", "safranin O", "Safranin O", 
						"β-gal", "Beta-gal", "beta-gal", "β-galactosidase", "Beta-galactosidase", "beta-galactosidase",
						"wright giemsa", "Wright giemsa"]

		pattern1 = ur'(?i)\b%s\b' % ("stained")
		pattern2 = ur'(?i)\b%s\b' % ("staining")

		containStain = False
		if re.search(pattern1, sentence) or re.search(pattern2, sentence):
			containStain = True

		# 2bi
		for rankDownItem in rankDownList:
			if containStain and rankDownItem in sentence:
				rating = rating - 1

		# 2bii
		pattern3 = ur'(?i)\b%s\b' % ("microscopy")
		pattern4 = ur'(?i)\b%s\b' % ("electron")
		if (re.search(pattern3, sentence) and re.search(pattern4, sentence)):
			rating = rating - 1

	# 2c: Western Blotting
	if parentTech.lower() == "Western blot".lower():
		rankDownList = ["silver", "Silver", "commassie", "Commassie", "ponceau", "Ponceau", "sypro", "Sypro"]

		for rankDownItem in rankDownList:
			if rankDownItem in sentence:
				rating = rating - 1

	# 2d: FACS
	if parentTech.lower() == "FACS".lower():
		rankDownList = ["propidium Iodine", "Propidium Iodine"]

		for rankDownItem in rankDownList:
			if rankDownItem in sentence:
				rating = rating - 1

	# 2e: Immuno-Precipitation
	if parentTech.lower() == "Immunoprecipitation".lower():
		pattern1 = ur'(?i)\b%s\b' % ("immunoprecipitation")
		pattern2 = ur'(?i)\b%s\b' % ("chromatin")
		pattern3 = ur'\b%s\b' % ("DNA")

		if re.search(pattern1, sentence) and (re.search(pattern2, sentence) or re.search(pattern3, sentence)):
			rating = rating - 1

	# 2f: Immuno-Staining or Western Blotting
	if parentTech.lower() == "Immunostaining".lower() or parentTech.lower() == "Western blot".lower():
		rankDownList = ["quantify", "Quantify", "quantified", "Quantified", "quantification", "Quantification", 
					"table", "Table", "graph", "Graph", "bar graph", "Bar graph"]

		for rankDownItem in rankDownList:
			if rankDownItem in sentence:
				rating = rating - 1

	# 2g: General Rule1
	rankDownListGeneral_1 = ["GFP", "EGFP", "RFP", "YFP"]
	for rankDownItem in rankDownListGeneral_1:
		tempSentence = sentence.replace("-", "")
		if rankDownItem in sentence:
			rating = rating - 1

	# 2h: General Rule2
	rankDownListGeneral_2 = ["siRNA", "shRNA", "knock down", "Knock down", "knocking down", "Knocking down", 
							"knock out", "Knock out", "knocking out", "Knocking out", "KO", "RNAi"]
	for rankDownItem in rankDownListGeneral_2:
			if rankDownItem in sentence:
				rating = rating - 1

	return rating
