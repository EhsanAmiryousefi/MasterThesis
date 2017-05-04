# -*- coding: utf-8 -*-
"""
Created on Wednesday May 3 2017 20 

@author: Ehsan Amiryousefi
"""




with open('splitter/Output.txt', 'r') as myfile:
      data=myfile.read()

      items = data.split('#')#the beginning of the regions are separated by the # sign
      for item in items:
            filename= (item.split('/')[-1].split('\n')[0].replace(':','_').replace(' ','_'))
            if filename != '':#if there is no file name, there is nothing to be written
                  if filename.find("Number")==-1:#if it is the first line of file just ignore it
                        filename=filename+'.txt'#add .txt extention to the file
                        print filename
                        with open("inputFiles/"+filename, "w") as text_file:
                              text_file.write('#'+ item)
                              text_file.close()
                  else :
                        continue
      myfile.close()


