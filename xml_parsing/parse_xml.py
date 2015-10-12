from lxml import etree
import codecs
import datetime
import django
import os
import re
import shutil
import sys
import tarfile

# sys.path.append('C:\\Python27\\scinapsis')
sys.path.append('D:\\GitHub\\scinapsis')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'scinapsis.settings')
sys.stdout = codecs.getwriter('utf8')(sys.stdout)
django.setup()
from scin.models import pub_meta, pub_material_n_method, pub_result, pub_figure, pub_support_info, pub_abstract, pub_discussion

def main(argv):     # debug
    process_xml("3191056", "temp\\J_Biol_Chem_2011_Aug_26_286(34)_30171-30180\\zbc30171.nxml", "testing")           # missing mnm
    process_xml("3929086", "temp\\Hum_Mol_Genet_2014_Mar_15_23(6)_1467-1478\\ddt534.nxml", "testing")
    process_xml("3255975", "temp\\J_Cell_Biol_2012_Jan_9_196(1)_115-130\\JCB_201103116.nxml", "testing")
    process_xml("2644779", "temp\\PLoS_ONE_2009_Feb_26_4(2)_e4597\\pone.0004597.nxml", "testing")
    process_xml("3898697", "temp\\Neurobiol_Dis_2014_Feb_62(100)_426-440\\main.nxml", "testing")
    process_xml("3771941", "temp\\Mol_Biol_Cell_2013_Sep_15_24(18)_2772-2784\\2772.nxml", "testing")
    process_xml("4342580", "temp\\J_Cell_Sci_2015_Mar_1_128(5)_964-978\\jcs-128-05-0964.nxml", "testing")
    process_xml("4237968", "temp\\Mol_Brain_2014_Aug_11_7_57\\s13041-014-0057-y.nxml", "testing")
    process_xml("4003245", "temp\\J_Cell_Biol_2014_Apr_28_205(2)_143-153\\JCB_201402104.nxml", "testing")
    process_xml("3930140", "temp\\eLife_2014_Feb_25_3_e01612\\elife01612.nxml", "testing")
    process_xml("4091171", "temp\\Autophagy_2014_Jun_1_10(6)_1105-1119\\auto-10-1105.nxml", "testing")

def process_xml(pmc_id, xmlFilename, pdfAddress):
    # TODO: expect input: pmc_id, file_name, pdf_file
    # sys.path.append('C:\\Python27\\scinapsis')
    # os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'scinapsis.settings')
    # sys.stdout = codecs.getwriter('utf8')(sys.stdout)
    # django.setup()
    # from scin.models import pub_meta, pub_material_n_method, pub_result, pub_figure, pub_support_info, pub_abstract, pub_discussion
    # from scin.models import pub_meta
    # from scin.models import pub_material_n_method
    # from scin.models import pub_result
    # from scin.models import pub_figure
    # from scin.models import pub_support_info
    # from scin.models import pub_abstract
    # from scin.models import pub_discussion

    # Step 3: parse xml file and save into root
    #inputFile = open('BCR-3-1-061.nxml', 'r')          #case0
    #inputFile = open('nihms-439946.nxml', 'r')          #case1
    #inputFile = open('pgen.1004216.nxml', 'r')          #case2
    inputFile = open(xmlFilename, 'r')          #case3
    tree = etree.parse(inputFile)
    root = tree.getroot()

    # create header object and process content
    meta_obj = pub_meta()

    try:
        parseMeta(root, meta_obj, pmc_id, pdfAddress)
    except:
        inputFile.close()
        errmsg = "Error in parseMeta inputFile of pmc_id: %s \n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)

    try:
        parseMNM(root, meta_obj)
    except:
        inputFile.close()
        errmsg = "Error in parseMNM inputFile of pmc_id: %s \n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)

    try:
        parseResult(root, meta_obj)
    except:
        inputFile.close()
        errmsg = "Error in parseResult inputFile of pmc_id: %s\n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)

    try:
        parseSuppInfo(root, meta_obj)
    except:
        errmsg = "Error in parseSuppInfo inputFile of pmc_id: %s\n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)

    try:
        parseFigure(root, meta_obj)
    except:
        inputFile.close()
        errmsg = "Error in parseFigure inputFile of pmc_id: %s\n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)

    try:
        parseAbstract(root, meta_obj)
    except:
        inputFile.close()
        errmsg = "Error in parseAbstract inputFile of pmc_id: %s\n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)

    try:
        parseDiscussion(root, meta_obj)
    except:
        inputFile.close()
        errmsg = "Error in parseDiscussion inputFile of pmc_id: %s\n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)

    # close resource finally
    inputFile.close()

def parseMeta(root, meta_obj, pmc_id, pdfAddress):
    meta_obj.source = "PubMed Central"

    element = root.xpath('//journal-meta//journal-title')
    if len(element) > 0:
        meta_obj.publisher = element[0].text

    element = root.xpath("//article-meta/title-group/article-title")
    meta_obj.title = etree.tostring(element[0], method='text', encoding='utf8')          # REMARK: only way to strip out tags

    meta_obj.src_address = "http://www.ncbi.nlm.nih.gov/pmc/articles/PMC" + pmc_id
    meta_obj.pdf_address = pdfAddress

    element = root.xpath('//journal-meta/publisher/publisher-name')
    if len(element) > 0:
        meta_obj.editors = element[0].text

    element = root.xpath("//article-meta/article-id[@pub-id-type='doi']")
    if len(element) > 0:
        meta_obj.doc_id = element[0].text

    element = root.xpath("//article-meta/article-id[@pub-id-type='pmid']")
    if len(element) > 0:
        meta_obj.pubmed_id = element[0].text

    element = root.xpath("//article-meta/article-id[@pub-id-type='pmc']")
    if len(element) > 0:
        meta_obj.pmc_id = element[0].text

    element = root.xpath("//article-meta/pub-date/year")
    temp_year = int(element[0].text)

    element = root.xpath("//article-meta/pub-date/month")
    temp_month = int(element[0].text)

    element = root.xpath("//article-meta/pub-date/day")
    temp_day = int(element[0].text)

    meta_obj.pub_date = datetime.date(temp_year, temp_month, temp_day)

    element = root.xpath("//article-meta/copyright-statement")
    if len(element) > 0:
        meta_obj.copyright = element[0].text

    element = root.xpath("//permissions/license/license-p")
    if len(element) < 0:
        meta_obj.license = etree.tostring(element[0],  method='text', encoding='utf8')

    elements = root.xpath("//article-meta/contrib-group/contrib[@contrib-type='author'][.//name/surname/text() and .//name/given-names/text()]")
    authorStr = ""
    for element in elements:
        surname = element.xpath(".//name/surname/text()")[0]
        givenName = element.xpath(".//name/given-names/text()")[0]
        fullname = givenName + " " + surname
        authorStr = authorStr + fullname + ","
    authorStr.rstrip(',')
    meta_obj.author = authorStr

    meta_obj.rec_update_time = datetime.datetime.now()
    meta_obj.rec_update_by = "sys"

    meta_obj.save()

def parseMNM(root, meta_obj):
    # check if tag exists, if not then quit the method
    sectElement = root.xpath("//body/sec[@sec-type='materials|methods']")
    if not len(sectElement) > 0:
        sectElement = root.xpath("//body/sec[@sec-type='methods']")
        if not len(sectElement) > 0:
            return

    # check if section exists (2 ways processing)
    subSectElements = sectElement[0].xpath("./sec|./*/sec|./*/*/sec")

    if len(subSectElements) > 0:
        subSectSeq = 1
        for subSectElement in subSectElements:
            titleElements = subSectElement.xpath("./title")
            paraElements = subSectElement.xpath("./p")
            mnmTitle = etree.tostring(titleElements[0], method='text', encoding='utf8')

            contentSeq = 1
            for paraElement in paraElements:
                paraStr = etree.tostring(paraElement, method='text', encoding='utf8')
                mnm_obj = pub_material_n_method()
                mnm_obj.doc = meta_obj
                mnm_obj.section_id = subSectSeq
                mnm_obj.header = mnmTitle
                mnm_obj.content_seq = contentSeq
                mnm_obj.content = paraStr
                mnm_obj.save()
                contentSeq =  contentSeq + 1
            subSectSeq = subSectSeq + 1
    else:
        paraElements = sectElement[0].xpath("./p")
        contentSeq = 1
        for paraElement in paraElements:
            contentStr = etree.tostring(paraElement, method='text', encoding='utf8')
            mnm_obj = pub_material_n_method()
            mnm_obj.doc = meta_obj
            mnm_obj.section_id = 1
            mnm_obj.header = ""
            mnm_obj.content_seq = contentSeq
            mnm_obj.content = contentStr
            mnm_obj.save()
            contentSeq = contentSeq + 1

def parseResult(root, meta_obj):
    # check if tag exists, if not then quit the method
    sectElement = sectElement = root.xpath("//body/sec[./title[contains(text(),'Results')]]")
    if not len(sectElement) > 0:
        return

    # check if section exists (2 ways processing)
    subSectElements = sectElement[0].xpath("./sec|./*/sec|./*/*/sec")

    if len(subSectElements) > 0:
        subSectSeq = 1
        for subSectElement in subSectElements:
            titleElements = subSectElement.xpath("./title")
            paraElements = subSectElement.xpath("./p")
            resultTitle = etree.tostring(titleElements[0], method='text', encoding='utf8')

            contentSeq = 1
            for paraElement in paraElements:
                paraStr = etree.tostring(paraElement, method='text', encoding='utf8')
                rslt_obj = pub_result()
                rslt_obj.doc = meta_obj
                rslt_obj.section_id = subSectSeq
                rslt_obj.header = resultTitle
                rslt_obj.content_seq = contentSeq
                rslt_obj.content = paraStr
                rslt_obj.save()
                contentSeq =  contentSeq + 1
            subSectSeq = subSectSeq + 1
    else:
        paraElements = sectElement[0].xpath("./p")
        contentSeq = 1
        for paraElement in paraElements:
            contentStr = etree.tostring(paraElement, method='text', encoding='utf8')
            rslt_obj = pub_result()
            rslt_obj.doc = meta_obj
            rslt_obj.section_id = 1
            rslt_obj.header = ""
            rslt_obj.content_seq = contentSeq
            rslt_obj.content = contentStr
            rslt_obj.save()
            contentSeq = contentSeq + 1

def parseSuppInfo(root, meta_obj):
    sectElement = root.xpath("//body/sec[@sec-type='supplementary-material']")
    if not len(sectElement) > 0:
        return

    subSectElements = sectElement[0].xpath("./supplementary-material")

    if len(subSectElements) > 0:
        subSectSeq = 1
        for subSectElement in subSectElements:
            titleElements = subSectElement.xpath("./label")
            paraElements = subSectElement.xpath(".//p")
            urlStr = subSectElement.xpath("./media/@xlink:href", namespaces={'xlink': 'http://www.w3.org/1999/xlink'})[0]

            # title
            suppInfoTitle = ""
            if len(titleElements) > 0:
                suppInfoTitle = etree.tostring(titleElements[0], method='text', encoding='utf8')
            else:
                titleElements = subSectElement.xpath(".//title")
                if len(titleElements) > 0:
                    suppInfoTitle = etree.tostring(titleElements[0], method='text', encoding='utf8')

            # concatenate all paragraph content
            paraStr = ""
            for paraElement in paraElements:
                paraStr = paraStr + etree.tostring(paraElement, method='text', encoding='utf8') + " "
            paraStr.rstrip(" ")

            suppInfo_obj = pub_support_info()
            suppInfo_obj.doc = meta_obj
            suppInfo_obj.section_id = subSectSeq
            suppInfo_obj.header = suppInfoTitle
            suppInfo_obj.content = paraStr
            suppInfo_obj.url = urlStr
            suppInfo_obj.save()

            subSectSeq = subSectSeq + 1

def parseFigure(root, meta_obj):
    sectElements = root.xpath("//fig")
    if not len(sectElements) > 0:
        return

    for sectElement in sectElements:
        labelElements = sectElement.xpath("./label")
        headerElements = sectElement.xpath("./title|./*/title|./*/*/title")
        paraElements = sectElement.xpath("./p|./*/p|./*/*/p")
        urlElements = sectElement.xpath(".//graphic/@xlink:href", namespaces={'xlink': 'http://www.w3.org/1999/xlink'})

        urlStr = ""
        if len(urlElements) > 0:
            urlStr = urlElements[0]

        paraStr = ""
        for paraElement in paraElements:
            paraStr = paraStr + etree.tostring(paraElement, method='text', encoding='utf8') + " "
        paraStr.rstrip(" ")

        figure_id = "0"
        if len(labelElements) > 0:
            labelStr = etree.tostring(labelElements[0], method='text', encoding='utf8')
            figNumList = re.findall(r'\d+', labelStr)
            if len(figNumList) > 0:
                figure_id = figNumList[0]

        headerStr = ""
        if len(headerElements) > 0:
            headerStr = etree.tostring(headerElements[0], method='text', encoding='utf8')

        figure_obj = pub_figure()
        figure_obj.doc = meta_obj
        figure_obj.figure_id = figure_id
        figure_obj.header = headerStr
        figure_obj.content = paraStr
        figure_obj.url = urlStr
        figure_obj.save()

def parseAbstract(root, meta_obj):
    sectElement = root.xpath("//abstract")
    if not len(sectElement) > 0:
        return

    # check if section exists (2 ways processing)
    subSectElements = sectElement[0].xpath("./sec|./*/sec|./*/*/sec")

    if len(subSectElements) > 0:
        subSectSeq = 1
        for subSectElement in subSectElements:
            titleElements = subSectElement.xpath("./title")
            paraElements = subSectElement.xpath("./p")
            absTitle = etree.tostring(titleElements[0], method='text', encoding='utf8')

            contentSeq = 1
            for paraElement in paraElements:
                paraStr = etree.tostring(paraElement, method='text', encoding='utf8')
                abs_obj = pub_abstract()
                abs_obj.doc = meta_obj
                abs_obj.section_id = subSectSeq
                abs_obj.header = absTitle
                abs_obj.content_seq = contentSeq
                abs_obj.content = paraStr
                abs_obj.save()
                contentSeq =  contentSeq + 1
            subSectSeq = subSectSeq + 1
    else:
        paraElements = sectElement[0].xpath("./p")
        contentSeq = 1
        for paraElement in paraElements:
            contentStr = etree.tostring(paraElement, method='text', encoding='utf8')
            abs_obj = pub_abstract()
            abs_obj.doc = meta_obj
            abs_obj.section_id = 1
            abs_obj.header = ""
            abs_obj.content_seq = contentSeq
            abs_obj.content = contentStr
            abs_obj.save()
            contentSeq = contentSeq + 1

def parseDiscussion(root, meta_obj):
    # check if tag exists, if not then quit the method
    sectElements = root.xpath("//body//sec[./title[contains(text(), 'Discussion')]]")
    if not len(sectElements) > 0:
        return

    if len(sectElements) > 0:
        subSectSeq = 1
        for sectElement in sectElements:
            titleElements = sectElement.xpath("./title")
            paraElements = sectElement.xpath("./p")
            discTitle = etree.tostring(titleElements[0], method='text', encoding='utf8')

            contentSeq = 1
            for paraElement in paraElements:
                paraStr = etree.tostring(paraElement, method='text', encoding='utf8')
                disc_obj = pub_discussion()
                disc_obj.doc = meta_obj
                disc_obj.section_id = subSectSeq
                disc_obj.header = discTitle
                disc_obj.content_seq = contentSeq
                disc_obj.content = paraStr
                disc_obj.save()
                contentSeq =  contentSeq + 1
            subSectSeq = subSectSeq + 1
    else:
        paraElements = sectElements[0].xpath("./p")
        contentSeq = 1
        for paraElement in paraElements:
            contentStr = etree.tostring(paraElement, method='text', encoding='utf8')
            disc_obj = pub_discussion()
            disc_obj.doc = meta_obj
            disc_obj.section_id = 1
            disc_obj.header = ""
            disc_obj.content_seq = contentSeq
            disc_obj.content = contentStr
            disc_obj.save()
            contentSeq = contentSeq + 1

if __name__ == "__main__":
    # sys.path.append('C:\\Python27\\scinapsis')
    # os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'scinapsis.settings')
    # sys.stdout = codecs.getwriter('utf8')(sys.stdout)
    # django.setup()
    # from scin.models import pub_meta, pub_material_n_method, pub_result, pub_figure, pub_support_info, pub_abstract, pub_discussion
    main(sys.argv[1:])