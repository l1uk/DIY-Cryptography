# definisci l'anello in cui lavoriamo
# prende I
import laif

def logmapseq(mu,X0,L):
    '''
    Restituisce un vettore di L numeri casuali ottenuti con la mappa logistica di
    costante mu e valore iniziale X0
    '''
    return 0

def oddchebseq(mu,C0,L):
    '''
    Restituisce un vettore di L interi positivi dispari ottenuti con la mappa di
    Chebishev di costante mu e valore iniziale C0
    '''
    return 0

def dlorenz(p,h):
    '''
    Restituisce l'incremento (dx,dy,dz) per l'integrazione numerica secondo
    Eulero dell'equazione dell'attrattore di Lorenz, a partire dal punto p e
    dal valore del passo h
    '''
    return 0

def life2perm(history):
    '''
    Restituisce la permutazione analizzando una certa cronologia di Life
    '''
    return 0

def encrypt(I,key):
    '''
    Restituisce l'immagine criptata secondo l'algoritmo Hybrid
    '''
    M,N = shape(I)
    X = logmapseq(key[mu1],key[X0],M*N)
    Y = logmapseq(key[mu2],key[Y0],M*N)
    Z[0] = np.array([(X>Y).reshape((M,N))])
    # evolvi k stadi
    P = life2perm(Z)
    C = oddchebseq(key[mu3],key[C0],M*N)
    # risolvi Lorenz in modo da ottenere abbastanza valori per L
    # E = (CP+T)I + L 
    return 0

def decrypt(E,key):
    '''
    Restituisce l'immagine decriptata secondo l'algoritmo Hybrid
    '''
    return 0
