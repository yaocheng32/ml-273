import csv as csv 
import numpy as np

def clean(data, col, miss_value):
    num_missing = data[data[:,col] == miss_value]
    print num_missing.shape

def cleanTrain():
    data = np.loadtxt('../data/phy_train.dat')
    # Clean columns 22,23,24,46,47,48: value 999 means "not available"
    cols = [21,22,23,45,46,47] # Index starting from zero
    data = np.delete(data, cols, 1)
    # Clean columns 31,57: value 9999 means "not available" 
    cols = [27,50]
    #clean(data, 27, 9999.0)
    data = np.delete(data, cols, 1)
#     [m,n] = data.shape
#     for i in range(m):
#         for j in range(1, n):
#             if data[i,j] == 999.0 or data[i,j] == 9999.0:
#                 print 'Error: %d %d' % (i, j)
#                 return 
#     print 'OK'
    fmt = '%d\t%d'
    for i in range(2, data.shape[1]):
        fmt = fmt + '\t%.6e'
    np.savetxt('../data/phy_train_cleaned.dat', data, fmt=fmt)

def cleanTest():
    data = np.genfromtxt('../data/phy_test.dat', dtype='str')
    data[:,1] = '0'
    data = data.astype(float)
    # Clean columns 22,23,24,46,47,48: value 999 means "not available"
    cols = [21,22,23,45,46,47] # Index starting from zero
    data = np.delete(data, cols, 1)
    # Clean columns 31,57: value 9999 means "not available" 
    cols = [27,50]
    data = np.delete(data, cols, 1)
#     [m,n] = data.shape
#     for i in range(m):
#         for j in range(1, n):
#             if data[i,j] == 999.0 or data[i,j] == 9999.0:
#                 print 'Error: %d %d' % (i, j)
#                 return 
#     print 'OK'
    fmt = '%d\t%d'
    for i in range(2, data.shape[1]):
        fmt = fmt + '\t%.6e'
    np.savetxt('../data/phy_test_cleaned.dat', data, fmt=fmt)


def main():
    #cleanTrain()
    #cleanTest()
    
main()