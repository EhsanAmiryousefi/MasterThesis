# -*- coding: utf-8 -*-
"""
Created on Fri Jul 11 13:23:13 2014

@author: Arya
"""

import numpy as np
import scipy as sp
import matplotlib.pyplot as plt
from matplotlib.ticker import MultipleLocator, FormatStrFormatter

import os

# Defining major and minor ticks for plotting
majorLocator   = MultipleLocator(4)
majorLocatory   = MultipleLocator(2)
majorFormatter = FormatStrFormatter('%d')
minorLocator   = MultipleLocator(1)

plt.rc("font", size=10)

# Iterating through all of the patterns for plotting
for (dirpath, dirnames, filenames) in os.walk('inputFiles/'):
    for patternFile in filenames:
        if patternFile.endswith('.txt'):
            print patternFile
            path = os.path.join(os.getcwd(), 'inputFiles/', patternFile)
            print path
            matData = np.genfromtxt(path, delimiter=' ', dtype=np.int ,comments='#', autostrip=True)
            print matData

            matData = matData/float(np.max(matData))
            print matData
            
            fig, ax = plt.subplots()
            plt.pcolor(matData, cmap='binary')
#            plt.title('Master/Worker')
            
            # set the limits of the plot to the limits of the data
            plt.yticks(np.arange(0,matData.shape[0], 5),range(0,matData.shape[0], 5))
            plt.xticks(np.arange(0,matData.shape[1], 5),range(0,matData.shape[1], 5))
            
            ax.xaxis.set_major_locator(majorLocator)
            ax.xaxis.set_major_formatter(majorFormatter)
            ax.yaxis.set_major_locator(majorLocatory)
            ax.yaxis.set_major_formatter(majorFormatter)
            
            #for the minor ticks, use no labels; default NullFormatter
            ax.xaxis.set_minor_locator(minorLocator)
            ax.yaxis.set_minor_locator(minorLocator)
            
            plt.xlim(0, matData.shape[0])
            plt.ylim(0, matData.shape[1])
            ax.grid(which='both', linestyle='-', color='#EDEDED')
            #plt.colorbar()
            plt.xlabel('Consumer Thread')
            #plt.ylabel('Producer Thread')
            
            fig = plt.gcf()
            fig.set_size_inches(4,4)
            fig.savefig(os.path.join(os.getcwd(), 'DataOutput/',os.path.splitext(patternFile)[0]+'.pdf'))
