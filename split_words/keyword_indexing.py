# -*- coding: utf-8 -*-
import re
import codecs
import itertools

# arguement setup
input_filename = "Abgent_AMAP_B_input.txt"
output_filename = "Abgent_AMAP_B_output.txt"
table_name = "Abgent_AMAP_B_indexing"

delimiters = "-", " ", '/', "(", ")", "[", "]"
regexPattern = "|".join(map(re.escape, delimiters))
print regexPattern

outputFile = codecs.open(output_filename, encoding='utf-8', mode='w+')

with codecs.open(input_filename) as f:
    lines = f.read().splitlines()
    for line in lines:
        print line

        # change line encoding as utf-8
        line = line.decode('utf-8')

        # split catalog_nb,product_fullname
        lineItems = re.split(u",", line, flags=re.UNICODE)
        catalogNb = lineItems[0]
        prodName = lineItems[1]

        # replace greek alphabet
        prodName = prodName.replace(u"α", "a")
        prodName = prodName.replace(u"β", "b")
        prodName = prodName.replace(u"γ", "g")
        prodName = prodName.replace(u"δ", "d")
        prodName = prodName.replace(u"ε", "e")
        prodName = prodName.replace(u"ζ", "z")
        prodName = prodName.replace(u"θ", "t")
        prodName = prodName.replace(u"κ", "k")
        prodName = prodName.replace(u"λ", "l")
        prodName = prodName.replace(u"Σ", "s")

        listItems = re.split(regexPattern, prodName)
        listItems = filter(lambda a: a != "", listItems)
        if "" in listItems:
            listItems.remove("")

        # combinations of synonyms
        synCombList = []
        for i in range(1, len(listItems)+1):
            tempList = list(itertools.combinations(listItems, i))
            synCombList.extend(tempList)

        outputSynonyms = []
        for synCombItem in synCombList:
            output1 = " ".join(synCombItem)
            output2 = "-".join(synCombItem)
            if len(output1) >= 3:
                outputSynonyms.append(output1)
            if len(output2) >= 3 and output1 <> output2:
                outputSynonyms.append(output2)

		# insert concatenated
        # spaceJointStr = "".join(list)
        # if spaceJointStr <> line:
         #    outputStr += ","
         #    outputStr += " ".join(list)
        # insert space str
        # spaceJointStr = " ".join(list)
        # if spaceJointStr <> line:
        #     outputStr += ","
        #     outputStr += " ".join(list)
        # insert hypen str
        # hypenJointStr = "-".join(list)
        # if hypenJointStr <> line:
        #     outputStr += ","
        #     outputStr += "-".join(list)

        outputStr = ""
        for item in outputSynonyms:
            outputStr += catalogNb + "," + item
            outputStr += '\n'

        outputFile.write(outputStr)

outputFile.close()

#example = "abd-123 ag"
#list = re.split(regexPattern, example)
#print list