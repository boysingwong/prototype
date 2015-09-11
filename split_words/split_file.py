# -*- coding: utf-8 -*-
import re
import codecs

delimiters = "-", " ", '/', "(", ")", "[", "]"
regexPattern = "|".join(map(re.escape, delimiters))
print regexPattern

outputFile = codecs.open("output_file.txt", encoding='utf-8', mode='w+')

with codecs.open(".\input_file.txt") as f:
    lines = f.read().splitlines()
    for line in lines:
        # replace greek alphabet
        line = line.decode('utf-8')

        line = line.replace(u"Î±", "a")
        line = line.replace(u"Î²", "b")
        line = line.replace(u"Î³", "g")
        line = line.replace(u"Î´", "d")
        line = line.replace(u"Îµ", "e")
        line = line.replace(u"Î¶", "z")
        line = line.replace(u"Î¸", "t")
        line = line.replace(u"Îº", "k")
        line = line.replace(u"Î»", "l")
        line = line.replace(u"Î£", "s")

        list = re.split(regexPattern, line)
        outputStr = line

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

        outputStr += ","
        for item in list:
            if len(item) > 0:
                outputStr += item
                outputStr += ","

        outputStr = outputStr.rstrip(',')
        outputStr += "\n"
        outputFile.write(outputStr)

outputFile.close()

#example = "abd-123 ag"
#list = re.split(regexPattern, example)
#print list