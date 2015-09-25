__author__ = 'wongmich'

listItems = ["i", "am", "a", "boy", "and", "she", "is", "a", "?"]

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

print outputSynonyms
