import numpy as np

shift = [[i,j] for i in range(-1,2) for j in range(-1,2) if i or j]

def evolve(field,B=[3],S=[2,3]):
    dim = field.shape[0]
    newField = field.copy()
    for i in np.arange(dim):
        for k in np.arange(dim):
            temp = np.array([i,k],dtype='i')
            intorno = temp+shift
            intorno = np.mod(intorno,dim)
            alive = np.sum(field[intorno[...,[0]],intorno[...,[1]]])
            "se si mette eater = 2 poi occhio che bisogna sottrarre"

            """
            test = (np.random.randint(0,1,size=(dim,dim)))
            test[intorno[...,[0]],intorno[...,[1]]] = 1;
            plt.imshow(test)
            plt.show()

            """
            if field[i][k]:
                if alive not in S:
                    newField[i][k]=0
            else:
                if alive in B:
                    newField[i][k]=1
    return newField

def insertPiece(file,i,j,field):
    piece = np.genfromtxt(file,delimiter=',').astype(int)
    dim = piece.shape
    field[i:i+dim[0],j:j+dim[1]] = piece
