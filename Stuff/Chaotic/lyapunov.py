#calcola l'esponente di Lyapunov di una regola
import sys
sys.path.append("/home/danivolo/Documenti/GitHub/GOL/moduli")
import numpy as np
import matplotlib.pyplot as plt
import laif

dim = 32
T = 50

main = np.random.randint(0,2,size=(dim,dim))

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
                alt = main.copy()
                alt[i,j] = not main[i,j]
                alt = laif.evolve(alt)
                h_tmp += alt != main
    h = h_tmp
    main = laif.evolve(main)
    print(t)
L = H/(np.arange(T)+1)
plt.plot(L)
plt.show()
print(L[-1])
