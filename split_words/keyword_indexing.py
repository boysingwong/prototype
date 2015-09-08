# -*- coding: utf-8 -*-
import re
import codecs

# arguement setup
input_filename = "Abgent_AMAP_input.txt"
output_filename = "Abgent_AMAP_output.txt"
table_name = "temp_Abgent_AMAP_indexing"

delimiters = "-", " ", '/', "(", ")", "[", "]"
regexPattern = "|".join(map(re.escape, delimiters))
print regexPattern

outputFile = codecs.open(output_filename, encoding='utf-8', mode='w+')

with codecs.open(input_filename) as f:
    lines = f.read().splitlines()
    for line in lines:
        # replace greek alphabet
        line = line.decode('utf-8')

        line = line.replace(u"α", "a")
        line = line.replace(u"β", "b")
        line = line.replace(u"γ", "g")
        line = line.replace(u"δ", "d")
        line = line.replace(u"ε", "e")
        line = line.replace(u"ζ", "z")
        line = line.replace(u"θ", "t")
        line = line.replace(u"κ", "k")
        line = line.replace(u"λ", "l")
        line = line.replace(u"Σ", "s")

        list = re.split(regexPattern, line)
        #outputStr = line

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
        for item in list:
            if len(item) > 0:
                outputStr += "insert into " + table_name + " values ('" + item + "');"
                outputStr += '\n'

        outputFile.write(outputStr)

outputFile.close()

#example = "abd-123 ag"
#list = re.split(regexPattern, example)
#print list