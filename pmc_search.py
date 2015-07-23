from lxml import etree
import urllib2

# method 1 - parse from string
response = urllib2.urlopen('http://www.pubmedcentral.nih.gov/utils/oa/oa.fcgi?term=cc+by+nc+license%5Bfilter%5D')
content = response.read()
response.close()
parsed = etree.fromstring(content)

# method 2 - parse from link directly
parsed = etree.parse('http://www.pubmedcentral.nih.gov/utils/oa/oa.fcgi?term=cc+by+nc+license%5Bfilter%5D').getroot()

# example of extraction
parsed.xpath('//responseDate/text()')
recordList = parsed.xpath('//records/record')
for record in recordList:
	PMCid = record.xpath('@id')[0]
	citation = record.xpath('@citation')[0]
resumption = parsed.xpath('//resumption/link/@href')[0]

