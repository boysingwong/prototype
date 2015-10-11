from lxml import etree
import codecs
import datetime
import django
import os
import shutil
import sys
import tarfile

def main(argv):
    # TODO: download the gz file from PMC
    #       1. check download fail
    #       2. if download fail process to next

    # Step 1: get file content as list
    # filelist = os.listdir("./")
    # filelist = filter(lambda a: a.endwith(".gz"), filelist)
    #
    # # Step 2: processing each filelist
    # for file in filelist:
    #     if os.path.isdir(file) == False:
    #         if os.path.exists('temp'):
    #             os.makedirs('temp')
    #
    #         # clear directory content
    #         removeDirContent('temp')
    #
    #         tar = tarfile.open(file)
    #         tar.extractall('temp')
            # tar.getNames()

            # TODO: items
            # 1. clean temp folder
            # 2. unzip and untar into temp folder
            # 3. get the .nxml file and process

    # Step 3: parse xml file and save into root
    inputFile = open('BCR-3-1-061.nxml', 'r')          #case0
    #inputFile = open('nihms-439946.nxml', 'r')          #case1
    #inputFile = open('pgen.1004216.nxml', 'r')          #case2
    #inputFile = open('pone.0124191.nxml', 'r')          #case3
    tree = etree.parse(inputFile)
    root = tree.getroot()

    # Step 4: create header object and process content
    meta_obj = pub_meta()

    parseMeta(root, meta_obj)
    parseMNM(root, meta_obj)
    parseResult(root, meta_obj)
    parseSuppInfo(root, meta_obj)

def parseMeta(root, meta_obj):
    element = root.xpath('//journal-meta/publisher/publisher-name')
    if len(element) > 0:
        meta_obj.publisher = element[0].text

    element = root.xpath("//article-meta/title-group/article-title")
    meta_obj.title = etree.tostring(element[0], method='text')          # REMARK: only way to strip out tags

    element = root.xpath("//article-meta/article-id[@pub-id-type='doi']")
    if len(element) > 0:
        meta_obj.doc_id = element[0].text

    # TODO: to add the new field into scin_pub_meta table
    # element = root.xpath("//article-meta/article-id[@pub-id-type='pmid']")
    # if len(element) > 0:
    #     meta_obj.pmid = element[0].text
    #
    # element = root.xpath("//article-meta/article-id[@pub-id-type='pmc']")
    # if len(element) > 0:
    #     meta_obj.pmc_id = element[0].text

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

    # TODO: to add new fields into scin_pub_meta table
    # element = root.xpath("//permissions/license/license-p")
    # if len(element) < 0:
    #     meta_obj.license = element[0].text

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
    # check if MNM exists, if not then quit the method
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
    # check if MNM exists, if not then quit the method
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
    sectElement = root.xpath("Fig[contains(@id,'F']")
    if len(sectElement) > 0:
        return

    subSectElement = sectElement[0].xpath("")

def removeDirContent(folder):
    for the_file in os.listdir(folder):
        file_path = os.path.join(folder, the_file)
        try:
            if os.path.isfile(file_path):
                os.unlink(file_path)
            elif os.path.isdir(file_path): shutil.rmtree(file_path)
        except Exception, e:
            print e

if __name__ == "__main__":
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'scinapsis.settings')
    sys.stdout = codecs.getwriter('utf8')(sys.stdout)
    django.setup()
    from scin.models import pub_meta, pub_material_n_method, pub_result, pub_figure, pub_support_info, pub_abstract, pub_discussion
    main(sys.argv[1:])