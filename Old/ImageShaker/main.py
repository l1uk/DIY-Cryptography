import os
import math
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import image
import game_of_life



image = image.imread('./input/sample.jpg')
imgGray = 0.2989 * image[:,:,0] + 0.5870 * image[:,:,1] + 0.1140 * image[:,:,2]
#plt.imshow(imgGray,cmap='gray')
#plt.show()

dimQuadrato = 10 # dimensione quadrato da inserire nel campo di golly (probabilmente non basta)
numeroIterazioni = 10 # (probabilmente non basta)

print('Risoluzione immagine: ' + str(image.shape[1]) +'x' +str(image.shape[0]))

print('Dimensione campi golly: ' + str(round(math.sqrt(image.shape[1]))) +' (colonne) ; ' +str(round(math.sqrt(image.shape[0]))) +' (righe)')

print('Lato quadrato random: ' + str(dimQuadrato))

print('Numero iterazioni golly ' + str(numeroIterazioni))

print('#######################')

#inizializzo golly per le righe 

dimy = round(math.sqrt(image.shape[0]))
dimx = round(math.sqrt(image.shape[0]))


randArray = np.random.randint(2, size=(dimQuadrato, dimQuadrato)); #quadrato random 
gollyRighe = game_of_life.main(dimx,dimy,randArray,numeroIterazioni); #array di istanti di golly

#inizializzo golly per le colonne

dimy = round(math.sqrt(image.shape[1]))
dimx = round(math.sqrt(image.shape[1]))
#volendo si puo' utilizzare un qudrato di partenza diverso per righe e colonne
gollyColonne = game_of_life.main(dimx,dimy,randArray,numeroIterazioni);


k = 1 # indicizza l'istante

celleGiaMesseAdUno = [] # celle messe ad uno all'istante k-1
ordineRighe = [] # ordine di permutazione delle colonne

for istante in gollyRighe:
    celleMesseAdUno = [] # celle messe ad uno all'istante k
    i = 0 # indicizza la cella per ogni istante
    for cella in np.nditer(istante):
        if(cella != 0):
            celleMesseAdUno.append(i) 
        i += 1

    for cellaAdUno in celleMesseAdUno:
        if cellaAdUno not in celleGiaMesseAdUno:
            ordineRighe.append(cellaAdUno) # se la cella non era già stata messa ad uno concateno la riga i-esima all'ordine delle righe 
            celleGiaMesseAdUno.append(cellaAdUno)
    k +=1
    plt.imsave('gollyRighe'+str(k)+'.png', istante)

print('dovrebbe essere ' +str(image.shape[0])+"="+str(max(ordineRighe))+"="+str(len(ordineRighe)))
print("e questo dovrebbe essere l'ordine delle righe permutate:")
print(ordineRighe)

"""

k = 0
ordineColonne = []
for nTH in gollyColonne:
    k +=1
    plt.imsave('gollyColonne'+str(k)+'.png', nTH)
"""