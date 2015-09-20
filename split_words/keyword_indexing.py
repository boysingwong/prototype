# -*- coding: utf-8 -*-
import re
import codecs
import itertools
import sys
import getopt

def main(argv):
    filename = ""
    try:
        opts, args = getopt.getopt(argv,"hf:",["filename="])
    except getopt.GetoptError:
        print 'keyword_indexing.py -f <filename>'
        sys.exit(2)

    for opt, arg in opts:
        if opt == '-h':
            print 'keyword_indexing.py -f <filename>'
            sys.exit()
        elif opt in ("-f", "--filename"):
            filename = arg


    print "filename: " + filename

    # arguement setup
    input_filename = filename + "_input.txt"
    output_filename = filename + "_output.sql"
    table_name = filename + "_indexing"

    delimiters = "+", "-", " ", '/', "(", ")", "[", "]"
    regexPattern = "|".join(map(re.escape, delimiters))
    print regexPattern

    outputFile = codecs.open(output_filename, encoding='utf-8', mode='w+')
    #outputFile = open(output_filename, 'w', 10000000)
    #outputFile = open(output_filename, 'w', 'ut-8')


    with codecs.open(input_filename) as f:
        lines = f.read().splitlines()
        for line in lines:
            print line

            # change line encoding as utf-8
            line = line.decode('utf-8')

            # split catalog_nb,product_fullname
            lineItems = re.split(u",", line, flags=re.UNICODE)
            prodId = lineItems[0]
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

            prodName = prodName.replace(u"\'", "\\\'")

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
                output1 = "".join(synCombItem)
                output2 = " ".join(synCombItem)
                output3 = "-".join(synCombItem)

                if len(output1) >= 3:
                    outputSynonyms.append(output1)
                else:
                    output1 = ""

                if len(output2) >= 3 and output2 <> output1:
                    outputSynonyms.append(output2)
                else:
                    output2 = ""

                if len(output3) >= 3 and output3 <> output1 and output3 <> output2:
                    outputSynonyms.append(output3)

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
                outputStr += "insert into pub_product_name (prod_id, name) "
                outputStr += "values (" + prodId + ", '" + item + "'); "
                outputStr += '\n'

            outputFile.write(outputStr)

    outputFile.close()

if __name__ == "__main__":
    main(sys.argv[1:])