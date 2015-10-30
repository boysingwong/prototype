# -*- coding: utf-8 -*-
from lxml import etree
import codecs
import datetime
import django
import glob
import os
import re
import shutil
import sys
import tarfile
import urllib2

# sys.path.append('C:\\Python27\\scinapsis')
sys.path.append('D:\\GitHub\\scinapsis')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'scinapsis.settings')
sys.stdout = codecs.getwriter('utf8')(sys.stdout)
django.setup()
from scin.models import pub_meta, pub_material_n_method, pub_result, pub_figure, pub_support_info, pub_abstract, pub_discussion

# def main(argv):     # debug
#     process_xml("3191056", "temp\\J_Biol_Chem_2011_Aug_26_286(34)_30171-30180\\zbc30171.nxml", "testing")           # missing mnm
#     process_xml("3929086", "temp\\Hum_Mol_Genet_2014_Mar_15_23(6)_1467-1478\\ddt534.nxml", "testing")
#     process_xml("3255975", "temp\\J_Cell_Biol_2012_Jan_9_196(1)_115-130\\JCB_201103116.nxml", "testing")
#     process_xml("2644779", "temp\\PLoS_ONE_2009_Feb_26_4(2)_e4597\\pone.0004597.nxml", "testing")
#     process_xml("3898697", "temp\\Neurobiol_Dis_2014_Feb_62(100)_426-440\\main.nxml", "testing")
#     process_xml("3771941", "temp\\Mol_Biol_Cell_2013_Sep_15_24(18)_2772-2784\\2772.nxml", "testing")
#     process_xml("4342580", "temp\\J_Cell_Sci_2015_Mar_1_128(5)_964-978\\jcs-128-05-0964.nxml", "testing")
#     process_xml("4237968", "temp\\Mol_Brain_2014_Aug_11_7_57\\s13041-014-0057-y.nxml", "testing")
#     process_xml("4003245", "temp\\J_Cell_Biol_2014_Apr_28_205(2)_143-153\\JCB_201402104.nxml", "testing")
#     process_xml("3930140", "temp\\eLife_2014_Feb_25_3_e01612\\elife01612.nxml", "testing")
#     process_xml("4091171", "temp\\Autophagy_2014_Jun_1_10(6)_1105-1119\\auto-10-1105.nxml", "testing")
#     process_xml("2225441", "temp\\PLoS_Biol_2008_Feb_5_6(2)_e26\\pbio.0060026.nxml", "testing")
#     process_xml("4202148", "temp\\Oncotarget_2014_Jul_31_5(17)_7610-7624\\oncotarget-05-7610.nxml", "testing")
#     process_xml("3789260", "temp\\Exp_Mol_Med_2013_Aug_16_45(8)_e36\\emm201368a.nxml", "testing")
#     process_xml("3688743", "temp\\FASEB_J_2013_Jul_27(7)_2880-2892\\z382880.nxml", "testing")
#     process_xml("3927476", "temp\\J_Lipid_Res_2014_Jan_55(1)_94-103\\94.nxml", "testing")
#
#     process_xml("2375970","temp\\J_Biomed_Biotechnol_2008_Apr_29_2008_821529\\JBB2008-821529.nxml","testing")
#     process_xml("3004410","temp\\J_Biomed_Biotechnol_2010_Dec_9_2010_506363\\JBB2010-506363.nxml","testing")
#     process_xml("3289941","temp\\Sarcoma_2012_Feb_20_2012_541650\\SRCM2012-541650.nxml","testing")
#     process_xml("3412140","temp\\Nat_Genet_2012_Jul_8_44(8)_910-915\\nihms385548.nxml","testing")
#     process_xml("3632086","temp\\Biochem_J_2013_Apr_15_451(Pt_2)_185-194\\bj4510185.nxml","testing")
#     process_xml("3730383","temp\\Biomed_Res_Int_2013_Jul_16_2013_689768\\BMRI2013-689768.nxml","testing")
#     process_xml("3758371","temp\\Nat_Genet_2013_Sep_28_45(9)_1088-1091\\nihms500273.nxml","testing")
#     process_xml("3781472","temp\\Diabetes_2013_Oct_17_62(10)_3469-3478\\3469.nxml","testing")
#     process_xml("4020497","temp\\Biomed_Res_Int_2014_Apr_27_2014_805236\\BMRI2014-805236.nxml","testing")
#     process_xml("4033348","temp\\Biomed_Res_Int_2014_May_7_2014_382653\\BMRI2014-382653.nxml","testing")
#     process_xml("4159437","temp\\Nat_Med_2014_Sep_10_20(9)_1018-1026\\nihms594557.nxml","testing")


#def process_xml(pmc_id, xmlFilename, pdfAddress):
def process_html(pmc_id):
    # get html content from url provide
    pmc_id = "3674072"              # TODO: to be remove from here
    url = "http://www.ncbi.nlm.nih.gov/pmc/articles/PMC" + pmc_id
    hdr = {'User-Agent': 'Mozilla/5.0'}

    # get root element from the html
    req = urllib2.Request(url,headers=hdr)
    response = urllib2.urlopen(req)
    html = response.read()
    root = etree.fromstring(html)
    nsmap = {'h': 'http://www.w3.org/1999/xhtml'}

    # sample of extract namespace element for xhtml format
    root.xpath("//h:head/h:title", namespaces=nsmap)

    # create header object and process content
    meta_obj = pub_meta()

    try:
        parseMeta(root, meta_obj, pmc_id, nsmap)
    except Exception, err:
        errmsg = "Error in parseMeta inputFile of pmc_id: %s \n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)
            print sys.exc_info()[0]

    try:
        parseMNM(root, meta_obj)
    except:
        errmsg = "Error in parseMNM inputFile of pmc_id: %s \n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)
            print sys.exc_info()[0]

    try:
        parseResult(root, meta_obj)
    except:
        errmsg = "Error in parseResult inputFile of pmc_id: %s\n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)
            print sys.exc_info()[0]

    try:
        parseSuppInfo(root, meta_obj)
    except:
        errmsg = "Error in parseSuppInfo inputFile of pmc_id: %s\n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)
            print sys.exc_info()[0]

    try:
        parseFigure(root, meta_obj, pmc_id)
    except:
        errmsg = "Error in parseFigure inputFile of pmc_id: %s\n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)
            print sys.exc_info()[0]

    try:
        parseAbstract(root, meta_obj)
    except:
        errmsg = "Error in parseAbstract inputFile of pmc_id: %s\n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)
            print sys.exc_info()[0]

    try:
        parseDiscussion(root, meta_obj)
    except:
        errmsg = "Error in parseDiscussion inputFile of pmc_id: %s\n" % ( pmc_id )
        with open("parse_error.log", 'a') as w:
            w.write(errmsg)
            print sys.exc_info()[0]


def parseMeta(root, meta_obj, pmc_id, nsmap):
    meta_obj.source = "PubMed Central"

    element = root.xpath("//h:head/h:meta[@name='citation_journal_title']/@content", namespaces=nsmap)
    if len(element) > 0:
        meta_obj.publisher = element[0]

    element = root.xpath("//h:head/h:title", namespaces=nsmap)
    meta_obj.title = etree.tostring(element[0], method='text', encoding='utf8')          # REMARK: only way to strip out tags

    # TODO: get pdf_address from xpath directly
    meta_obj.src_address = "http://www.ncbi.nlm.nih.gov/pmc/articles/PMC" + pmc_id

    element = root.xpath("//h:head/h:link[@rel='alternate' and @type='application/pdf']/@href", namespaces=nsmap)
    if len(element) > 0:
        meta_obj.pdf_address = element[0]

    element = root.xpath("//h:head/h:meta[@name='DC.Publisher']/@content", namespaces=nsmap)
    if len(element) > 0:
        meta_obj.editors = element[0]

    element = root.xpath("//h:head/h:meta[@name='citation_doi']/@content", namespaces=nsmap)
    if len(element) > 0:
        meta_obj.doc_id = element[0]

    element = root.xpath("//h:head/h:meta[@name='citation_pmid']/@content", namespaces=nsmap)
    if len(element) > 0:
        meta_obj.pubmed_id = element[0]

    meta_obj.pmc_id = pmc_id

    element = root.xpath("//h:head/h:meta[@name='citation_date']/@content", namespaces=nsmap)
    if len(element) > 0:
        meta_obj.pub_date = datetime.date.strptime(element[0], '%d %b %Y').date()

    element = root.xpath("//h:body//h:div[contains(@class, 'fm-copyright')]", namespaces=nsmap)
    copyrightStr = ""
    for item in element:
        copyrightStr = copyrightStr + " " + etree.tostring(element,  method='text', encoding='utf8')
    meta_obj.copyright = copyrightStr.rstrip(" ")


    meta_obj.license = copyrightStr

    element = root.xpath("//h:head//h:meta[@name = 'citation_authors']/@content", namespaces=nsmap)
    if len(element):
        meta_obj.author = element[0]

    meta_obj.rec_update_time = datetime.datetime.now()
    meta_obj.rec_update_by = "sys"

    meta_obj.save()

def parseMNM(root, meta_obj):
    # check if tag exists, if not then quit the method
    sectElement = root.xpath("//body/sec[@sec-type='materials|methods' or @sec-type='methods']")
    if not len(sectElement) > 0:
        sectElement = sectElement = root.xpath("//body/sec[./title[contains(text(),'Method') or contains(text(),'METHOD') "
                                               "or contains(text(),'Experimental') or contains(text(),'EXPERIMENTAL')]]")
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
                paraStr = filter_using_re(paraStr.decode('utf-8'))                      # resolve utf-8 out of range issue
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
            paraStr = paraStr.rstrip(" ")

            suppInfo_obj = pub_support_info()
            suppInfo_obj.doc = meta_obj
            suppInfo_obj.section_id = subSectSeq
            suppInfo_obj.header = suppInfoTitle
            suppInfo_obj.content = paraStr
            suppInfo_obj.url = urlStr
            suppInfo_obj.save()

            subSectSeq = subSectSeq + 1

def parseFigure(root, meta_obj, pmc_id):
    sectElements = root.xpath("//fig")
    if not len(sectElements) > 0:
        return

    for sectElement in sectElements:
        labelElements = sectElement.xpath("./label")
        headerElements = sectElement.xpath("./title|./*/title|./*/*/title")
        paraElements = sectElement.xpath("./p|./*/p|./*/*/p")
        urlElements = sectElement.xpath(".//graphic/@xlink:href", namespaces={'xlink': 'http://www.w3.org/1999/xlink'})

        # TODO: to be defined here
        urlStr = ""
        # if len(urlElements) > 0:
        #     urlStr = urlElements[0]
        #     # complete url
        #     fileList = glob.glob(srcFilePath + "\\" + urlStr + ".*")
        #     if len(fileList) > 0:
        #         figFilename = os.path.basename(fileList[0])
        #         urlStr = "http://www.ncbi.nlm.nih.gov/pmc/articles/PMC" + pmc_id + "/bin/" + figFilename

        paraStr = ""
        for paraElement in paraElements:
            paraStr = paraStr + etree.tostring(paraElement, method='text', encoding='utf8') + " "
        paraStr = paraStr.rstrip(" ")

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

def filter_using_re(unicode_string):
    re_pattern = re.compile(u'[^\u0000-\uD7FF\uE000-\uFFFF]', re.UNICODE)
    return re_pattern.sub(u'\uFFFD', unicode_string)

if __name__ == "__main__":
    # sys.path.append('C:\\Python27\\scinapsis')
    # os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'scinapsis.settings')
    # sys.stdout = codecs.getwriter('utf8')(sys.stdout)
    # django.setup()
    # from scin.models import pub_meta, pub_material_n_method, pub_result, pub_figure, pub_support_info, pub_abstract, pub_discussion
    main(sys.argv[1:])