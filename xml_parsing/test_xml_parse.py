from lxml import etree

# get resd only file
inputFile = open('BCR-3-1-061.nxml', 'r')
tree = etree.parse(inputFile)

element = root.xpath('//publisher/publisher-name')
publisher = element[0].text