function FredkinPRNG(N,File)
%Genera una sequenza di 32*N zeri/uni che va poi convertita in 32-bit
%unsigned integers
%Il seme sarebbero le condizioni iniziali della mappa logistica, per adesso
%prende seme casuale
%Genera una configurazione 32x32 e la fa evolvere secondo Fredkin, automa
%molto caotico

D = 32;%Dimensioni della board
K = ceil(N/32);%Iterazioni richieste
mu = 3.9+rand()*(4.0-3.9);%Parametro della mappa logistica tra 3.9 e 4
X0 = rand();%Parametro della mappa logistica tra 0 e 1

Powers = 2.^(0:31)';

board = reshape((LogisticRandomSequence(D^2,mu,X0)>0.5),D,D);
Sequence = board*Powers;
dlmwrite(File,Sequence,'precision',12)
%Genera una board guardando in ogni posizione se siamo sopra o sotto 0.5,
%raggiunge una percentuale di fill di circa 50%
for i=1:K
    dlmwrite(File,Sequence,'-append', 'precision',12)
    %concatena al risultato la board srotolata
    board = Evolve(board,'Fredkin');
    Sequence = board*Powers;
    disp(100*i/N)
end
dlmwrite(File,board(:),'-append', 'precision',12)
%BinarySeq = BinarySeq(1:32*N);%prende solo i primi 32*N
end