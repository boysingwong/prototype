from lxml import etree
import os
import tarfile

def main(argv):
    # get file content as list
    filelist = os.listdir("./")
    filelist = filter(lambda a: a.endwith(".gz"), filelist)

    #processing each filelist
    for file in filelist:
        if os.path.isdir(file) == False:
            if os.path.exists('temp'):
                os.makedirs('temp')

            # clear directory content
            removeDirContent('temp')

            tar = tarfile.open(file)
            tar.extractall('temp')
            # tar.getNames()

            # 1. clean temp folder
            # 2. unzip and untar into temp folder
            # 3. get the .nxml file and process

    # get resd only file
    inputFile = open('BCR-3-1-061.nxml', 'r')
    tree = etree.parse(inputFile)
    root = tree.getroot()

    element = root.xpath('//publisher/publisher-name')
    publisher = element[0].text

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
    main(sys.argv[1:])