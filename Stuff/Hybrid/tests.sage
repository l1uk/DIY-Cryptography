#trascrivi le trasformazioni lineari T
#genera permutazioni casuali
#verifica se la somma è invertibile
import numpy as np
bit = 4
M = 4
N = 4

AnelloPol = PolynomialRing(FiniteField(2),'x')
Ideale = AnelloPol.ideal([x^bit])
R = AnelloPol.quotient(Ideale,names='t')
R(1)
MS = MatrixSpace(R,M*N)
T1_list = [[0]*i+[i+1]*(M*N-i) for i in range(M*N)]
T1_arr = np.array(T1_list).transpose()
T2_arr = np.flip(T1_arr,axis=1)
T = T2_arr @ T1_arr
print(T)
t = R('t')
def Z2R(n):
    binario = int(n).digits(2)
    base = [t^i for i in range(len(binario))]
    return np.dot(base,binario)

def Zarr2R(old):
    new = MS(old)
    shape = np.shape(old)
    for i in range(shape[0]):
        for j in range(shape[0]):
            new[i,j] = Z2R(old[i,j])
    return new

print(Zarr2R(T))
