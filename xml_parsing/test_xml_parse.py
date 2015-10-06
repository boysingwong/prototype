from lxml import etree
import datetime
import django
import os
import shutil
import sys
import tarfile

def main(argv):
    # TODO: download the gz file from PMC

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
    inputFile = open('BCR-3-1-061.nxml', 'r')
    tree = etree.parse(inputFile)
    root = tree.getroot()

    # Step 4: get pub_meta
    meta_obj = pub_meta()

    source = "PubMed Center"
    element = root.xpath('//publisher/publisher-name')
    meta_obj.publisher = element[0].text

    element = root.xpath("//article-meta/article-id[@pub-id-type='pmc']")
    meta_obj.doc_id = element[0].text

    # element = root.xpath("//article-meta/pub-date[@pub-type='epub']/year")
    # meta_obj.year = element[0].text
    #
    # element = root.xpath("//article-meta/pub-date[@pub-type='epub']/month")
    # meta_obj.month = element[0].text
    #
    # element = root.xpath("//article-meta/pub-date[@pub-type='epub']/day")
    # meta_obj.day = element[0].text

    meta_obj.pub_date = datetime.date(2015, 11, 22)

    print meta_obj.publisher
    print meta_obj.doc_id

    meta_obj.save()


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
    django.setup()
    from scin.models import pub_meta, pub_material_n_method, pub_result, pub_figure, pub_support_info, pub_abstract, pub_discussion
    main(sys.argv[1:])