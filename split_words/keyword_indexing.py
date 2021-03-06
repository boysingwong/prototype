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
    error_log = filename + "_error.log"
    table_name = filename + "_indexing"

    delimiters = "+", "-", " ", '/', "(", ")", "[", "]"
    regexPattern = "|".join(map(re.escape, delimiters))
    print regexPattern

    outputFile = codecs.open(output_filename, encoding='utf-8', mode='w+')
    #outputFile = open(output_filename, 'w', 10000000)
    #outputFile = open(output_filename, 'w', 'ut-8')


    with codecs.open(input_filename) as f:
        lines = f.read().splitlines()

        lineNb = 0
        for line in lines:
            lineNb = lineNb + 1
            print line

            try:
                # change line encoding as utf-
                #line = line.decode('utf-8')
                line = unicode(line, errors='ignore')

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

                # processing items and add into list
                lastItem = ""
                outputSynonyms = []
                for item in listItems:
                    if len(lastItem) < 3:       # process last item
                        synonym1 = lastItem + item
                        synonym2 = lastItem + "-" + item
                        if len(synonym1) >= 3:
                            if not synonym1 in outputSynonyms: outputSynonyms.append(synonym1)
                        if len(synonym2) >= 3:
                            if not synonym2 in outputSynonyms: outputSynonyms.append(synonym2)

                    if len(item) >= 3:
                        outputSynonyms.append(item)
                    else:
                        synonym1 = lastItem + item
                        synonym2 = lastItem + "-" + item
                        if len(synonym1) >= 3:
                            if not synonym1 in outputSynonyms: outputSynonyms.append(synonym1)
                        if len(synonym2) >= 3:
                            if not synonym2 in outputSynonyms: outputSynonyms.append(synonym2)

                    lastItem = item

                # combinations of synonyms
                # synCombList = []
                # for i in range(1, len(listItems)+1):
                #     tempList = list(itertools.combinations(listItems, i))
                #     synCombList.extend(tempList)
                #
                # outputSynonyms = []
                # for synCombItem in synCombList:
                #     output1 = "".join(synCombItem)
                #     output2 = " ".join(synCombItem)
                #     output3 = "-".join(synCombItem)
                #
                #     if len(output1) >= 3:
                #         outputSynonyms.append(output1)
                #     else:
                #         output1 = ""
                #
                #     if len(output2) >= 3 and output2 <> output1:
                #         outputSynonyms.append(output2)
                #     else:
                #         output2 = ""
                #
                #     if len(output3) >= 3 and output3 <> output1 and output3 <> output2:
                #         outputSynonyms.append(output3)

                outputStr = ""
                for item in outputSynonyms:
                    outputStr += "insert into pub_product_name (prod_id, name) "
                    outputStr += "values (" + prodId + ", '" + item + "'); "
                    outputStr += '\r\n'

                outputFile.write(outputStr)

            except:
                msg = "error in line " + str(lineNb) + " [" + line + "]\r\n"
                errLog = open(error_log, mode="a")
                errLog.write(msg)

    outputFile.close()

if __name__ == "__main__":
    main(sys.argv[1:])