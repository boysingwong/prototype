import re

delimiters = "-", " "
regexPattern = "|".join(map(re.escape, delimiters))
print regexPattern

outputFile = open("output_file.txt", "w")

with open(".\input_file.txt") as f:
    lines = f.read().splitlines()
    for line in lines:
        list = re.split(regexPattern, line)
        outputStr = line
        # insert space str
        spaceJointStr = " ".join(list)
        if spaceJointStr <> line:
            outputStr += ","
            outputStr += " ".join(list)
        # insert hypen str
        hypenJointStr = "-".join(list)
        if hypenJointStr <> line:
            outputStr += ","
            outputStr += "-".join(list)

        outputStr += ","
        for item in list:
            if len(item) >= 3:
                outputStr += item
                outputStr += ","

        outputStr = outputStr.rstrip(',')
        outputStr += "\n"
        outputFile.write(outputStr)

outputFile.close()

#example = "abd-123 ag"
#list = re.split(regexPattern, example)
#print list