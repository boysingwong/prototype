# -*- coding: utf-8 -*- 
import codecs
import MySQLdb
import re
import sys
from warnings import filterwarnings

TAG_RE = re.compile(r'<[^>]+>')

def search_keyword():
	filterwarnings('ignore', category = MySQLdb.Warning)
	sys.stdout = codecs.getwriter('utf8')(sys.stdout)

	print "start connection"
	try:
		mysql = MySQLdb.connect(user='root',passwd='password1',db='scin_db',host='127.0.0.1',port=3306, autocommit = 'True', charset = 'utf8', use_unicode = True)
		# mysql = MySQLdb.connect(user='root',passwd='db_4tp3fen',db='scin_db',host='127.0.0.1',port=8796, autocommit = 'True', charset = 'utf8', use_unicode = True)
		mysql_cursor = mysql.cursor()
		print "connect successfully"
		
		# extract result from result tables
		# TODO: call procedure to search and insert search result
		
		query = ("SELECT doc_id, source, source_id, keyword, content FROM scin_db.pub_keyword_temp")
		mysql_cursor.execute(query)
		
		rsltCount = 0
		for (doc_id, source, source_id, keyword, content) in mysql_cursor:
			sentenceList = re.split(ur'(?<!\w\.\w.)(?<![A-Z]\.)(?<=\.|\?)\s', content)
			for sentence in sentenceList:
				keyword_exists = False
				
				# remove tag
				sentence = remove_tags(sentence)
				
				# trim space
				sentence = sentence.strip()

				print "process sentence [%s]" % sentence

				# a. check keyword exists
				pattern = ur'(?i)\b%s\b' % (keyword)
				if re.search(pattern, sentence):
					print "keyword found [%s]" % keyword
					keyword_exists = True
				else:
					continue

				if keyword_exists:
					print "insert result to result_table"
					insertStmt = ("INSERT INTO scin_db.pub_keyword_results "
								  "(doc_id, source, source_id, keyword, content, sentence) "
								  "VALUES (%s, %s, %s, %s, %s, %s)")
					mysql_cursor.execute(insertStmt, (doc_id, source, source_id, keyword, content, sentence) )
					mysql.commit()

					rsltCount = rsltCount + 1


		# STEP 2: insert into word table
		# get result Id
		queryInner = ("SELECT id, sentence FROM scin_db.pub_keyword_results")
		mysql_cursor.execute( queryInner )

		for (id, sentence) in mysql_cursor:
			sentence = sentence.rstrip('.')
			wordList = re.split('\s', sentence)
			for word in wordList:
				word = word.replace(",", "")
				insertStmt2 = ("INSERT INTO scin_db.pub_keyword_result_splits "
							   "(rslt_id, sentence, word) "
							   "VALUES (%s, %s, %s)")
				mysql_cursor.execute(insertStmt2, (id, sentence, word))
				mysql.commit()

		mysql_cursor.close()
		mysql.close()
		
		return rsltCount

	except MySQLdb.Error, e:
		errmsg = "MySQL Error (@%s) %d:  %s" % ( keyword, e.args[0], e.args[1] )
		with open("error.log", 'w') as w:
			w.write(errmsg)
		sys.exit(1)

def remove_tags(text):
	return TAG_RE.sub('', text)
		
def main():
	search_keyword()

if __name__ == '__main__': main()
