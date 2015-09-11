from lxml import etree

def main(argv):
    # get resd only file
    inputFile = open('BCR-3-1-061.nxml', 'r')
    tree = etree.parse(inputFile)
    root = tree.getroot()

    element = root.xpath('//publisher/publisher-name')
    publisher = element[0].text


if __name__ == "__main__":
    main(sys.argv[1:])