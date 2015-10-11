from lxml import etree
import codecs
import datetime
import django
import os
import shutil
import sys
import tarfile

sys.path.append('C:\\Python27\\scinapsis')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'scinapsis.settings')
sys.stdout = codecs.getwriter('utf8')(sys.stdout)
django.setup()
from scin.models import pub_meta, pub_material_n_method, pub_result, pub_figure, pub_support_info, pub_abstract, pub_discussion

def main(argv):     # debug
    process_xml("3657744", "temp\\Nat_Med_2013_Mar_4_19(3)_345-350\\nihms-439946.nxml", "ftp://ftp.ncbi.nlm.nih.gov/pub/pmc/7f/f4/13000_2014_Article_200.PMC4245773.pdf")

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
        errmsg = "Error in parseMeta inputFile of pmc_id: %s \n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)

    try:
        parseMNM(root, meta_obj)
    except:
        errmsg = "Error in parseMNM inputFile of pmc_id: %s \n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)

    try:
        parseResult(root, meta_obj)
    except:
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
        errmsg = "Error in parseFigure inputFile of pmc_id: %s\n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)

    try:
        parseAbstract(root, meta_obj)
    except:
        errmsg = "Error in parseAbstract inputFile of pmc_id: %s\n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)

    try:
        parseDiscussion(root, meta_obj)
    except:
        errmsg = "Error in parseDiscussion inputFile of pmc_id: %s\n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)

def parseMeta(root, meta_obj, pmc_id, pdfAddress):
    meta_obj.source = "PubMed Central"

    element = root.xpath('//journal-meta//journal-title')
    if len(element) > 0:
        meta_obj.publisher = element[0].text

    element = root.xpath("//article-meta/title-group/article-title")
    meta_obj.title = etree.tostring(element[0], method='text')          # REMARK: only way to strip out tags

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

    element = root.xpath("//article-meta/pub-date[@pub-type='epub']/year")
    temp_year = int(element[0].text)

    element = root.xpath("//article-meta/pub-date[@pub-type='epub']/month")
    temp_month = int(element[0].text)

    element = root.xpath("//article-meta/pub-date[@pub-type='epub']/day")
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
    subSectElements = sectElement[0].xpath("./sec")

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
    subSectElements = sectElement[0].xpath("./sec")

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
        headerElements = sectElement.xpath(".//title")
        paraElements = sectElement.xpath(".//p")
        urlStr = sectElement.xpath(".//graphic/@xlink:href", namespaces={'xlink': 'http://www.w3.org/1999/xlink'})[0]

        paraStr = ""
        for paraElement in paraElements:
            paraStr = paraStr + etree.tostring(paraElement, method='text', encoding='utf8') + " "
        paraStr.rstrip(" ")

        figure_obj = pub_figure()
        figure_obj.doc = meta_obj

        labelStr = etree.tostring(labelElements[0], method='text', encoding='utf8')
        if labelStr.startswith("Figure "):
            labelStr = labelStr.lstrip("Figure ")
        elif labelStr.startswith("Fig "):
            labelStr = labelStr.lstrip("Fig ")
        figure_obj.figure_id = labelStr

        if len(headerElements) > 0:
            figure_obj.header = etree.tostring(headerElements[0], method='text', encoding='utf8')

        figure_obj.content = paraStr
        figure_obj.url = urlStr
        figure_obj.save()

def parseAbstract(root, meta_obj):
    sectElement = root.xpath("//abstract")
    if not len(sectElement) > 0:
        return

    # check if section exists (2 ways processing)
    subSectElements = sectElement[0].xpath("./sec")

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