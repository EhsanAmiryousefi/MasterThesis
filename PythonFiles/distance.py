import numpy as np
import json
import csv
import sys

threadPair = dict()
threadPairUnique = dict()
threadPairDistance = dict()

def preprocess(path):
    with open(path,'r') as f:
        for idx, line in enumerate(f):
            items = line.split(' ')
            for idy, item in enumerate(items):
                if item.startswith('$'):
                    item = item[1:]
                    memoryLocations = item.split(',')
                    threadPair['{0}->{1}'.format(idx, idy)] = np.array(memoryLocations)

def compute_unique_ratio():
    for key in threadPair:
        print '{0}: {1}'.format(key, 1.0*threadPairUnique[key].size/threadPair[key].size)

def compute_unique():
    for key in threadPair:
        threadPairUnique[key] = np.unique(threadPair[key])

def compute_distances():
    for key in threadPairUnique:
        tmp = list()
        for item in threadPairUnique[key]:
            indices = np.where(threadPair[key] == item)[0]
            if indices.size > 1:
                for n, k in zip(indices[:-1], indices[1:]):
                    tmp.append(k-n)
        if len(tmp) > 0:
            a = np.array(tmp)
            threadPairDistance[key] = (a.min(), a.max(), np.average(a), np.median(a))
    print threadPairDistance



def main():
    #filename = 'Locality/sampledata.txt'
    filename=sys.argv[-1]
        #filename=line
        #filename='Locality/'+filename
    preprocess(filename)

    compute_unique()
    # compute_unique('locality/CG_reduction_295.txt')
    # compute_unique_ratio()
    compute_distances()

    with open('reuse_'+filename.split('/')[1], 'w') as fp:
        json.dump(threadPairDistance, fp, indent=4)

        
    with open('reuse_dict'+filename.split('/')[1].split('.')[0]+'.csv', 'wb') as csv_file:
        writer = csv.writer(csv_file)
        for key, value in threadPairDistance.items():
           writer.writerow([key, value[0], value[1], value[2], value[3]])

if __name__=='__main__':
    main()


