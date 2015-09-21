# -*- coding: utf-8 -*-
import re
import codecs

# define specificity mapping
mapping = {
    "B": "Bovine",
    "Ce":"C. elegans",
    "C": "Chicken",
    "Dm": "D. melanogaster",
    "Dg": "Dog",
    "Gp": "Guinea Pig",
    "Hm": "Hamster",
    "Hr": "Horse",
    "H": "Human",
    "Mi": "Mink",
    "Mk": "Monkey",
    "M": "Mouse",
    "Pg": "Pig",
    "R": "Rat",
    "Sc": "S. cerevisiae",
    "X": "Xenopus",
    "Z": "Zebrafish",
}


delimiters = "-", " ", '/', "(", ")", "[", "]"
regexPattern = "|".join(map(re.escape, delimiters))
print regexPattern

outputFile = codecs.open("output_file.txt", encoding='utf-8', mode='w')

with codecs.open(".\input_file.txt") as f:
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
        list = filter(lambda a: a != "", list)
        outputStr = ""

        for item in list:
            # convert item into fullname
            if mapping.has_key(item):
                item = mapping.get(item)

            outputStr += item
            outputStr += ","

        outputStr = outputStr.rstrip(',')
        outputStr += "\r\n"
        outputFile.write(outputStr)

outputFile.close()

#example = "abd-123 ag"
#list = re.split(regexPattern, example)
#print list