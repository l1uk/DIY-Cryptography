#calcola l'esponente di Lyapunov di una regola, con golly
import sys
sys.path.append("/home/danivolo/Documenti/GitHub/GOL/moduli")
import numpy as np
import matplotlib.pyplot as plt
import laif
import golly as g

rule = "B3/S230"
dim = 32
T = 50
rho = 50

toroidal_rule = rule + ":T" + str(dim) + "," + str(dim)
g.new("Lyapunov")

all = [0,0,dim,dim]
g.select(all)
g.randfill(rho)
main = g.getlayer()
alt = g.duplicate()
g.setlayer(alt)

h = np.zeros((dim,dim))
c1,c2 = np.random.randint(0,dim-1,size=2)
h[c1,c2] = 1

H = np.zeros(T)

for t in range(T):
    h_tmp = np.zeros((dim,dim))
    for i in range(dim):
        for j in range(dim):
            if h[i,j]:
                H[t] += h[i,j]
                g.dellayer(alt)
                alt = g.duplicate()
                g.setlayer(alt)
                g.setcell(i,j,1 - g.getcell(i,j))
                g.run(1)
                g.copy(0,0,"xor")
                g.select(all)
                idxs = g.getcells()
                h_tmp += alt != main
    h = h_tmp
    g.setlayer(main)
    g.run(1)
    print(t)
L = H/(np.arange(T)+1)
plt.plot(L)
plt.show()
print(L[-1])
