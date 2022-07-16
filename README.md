# GOL
Esploriamo le applicazioni della caoticità degli automi cellulari alla crittografia.

## Presentazione
Una [presentazione](https://1drv.ms/p/s!Ai4UpOWgiwLEqkcNpdKv7rPl_6n8?e=qhNEvU) con 

- Breve storia degli automi cellulari (Von Neumann)
- Automi cellulari elementari e classificazione di Wolfram
- Breve storia e completezza di Turing di Rule 110
- Breve storia e completezza di Turing di Life
- Metriche sulla complessità: articolo dei brasiliani
- Cenni al tentativo di PRNG con Fredkin, che però non passa nessun test DieHard e nemmeno la piattezza dell'istogramma: primi indizi che non è così facile ottenere "entropia"
- Fredkin: breve storia e motivazioni
- **Algoritmo di crittografia per le immagini** basato su Life (e/o Fredkin):
  - Cuore: meccanismo di permutazione
  - Cenni sul resto dell'algoritmo (diffusione dei valori di grigio) che noi non implementiamo perché 
    1. Non legato ai CA
    2. L'ultimo passo fornisce risultati desiderabili, ma rende l'algoritmo irreversibile (citazione dell'altro articolo degli stessi autori dove lo si dimostra)
  - Test statistici che usiamo e test che menzioniamo ma scartiamo perché sensati solo usando l'algoritmo completo
  - Risultati e interpretazione
- Cenno a implementazione di ECA (computazionalmente veloce) in IoT, ma anche all'articolo che dimostra che nessun PRNG basato su ECA è immune ad attacchi di correlazione.
- Conclusioni deludenti: mi sa che gli automi cellulari non sono necessariamente il massimo

## Algoritmo

Encrypter.m disordina i pixel di un'immagine a partire da una password, costituita ancora dai parametri di una mappa logistica. 

La password genera una configurazione iniziale di un automa cellulare, che viene fatta evolvere, e l'intera storia dell'automa viene usata per permutare i pixel secondo Permute.m.

Successivamente si effettuano dei test statistici di correlazione tra immagini iniziali e finali, e di sensibilità dell'immagine criptata rispetto a un piccolo cambiamento nella password.

# Analisi e interpretazione
- Test di correlazione:
  1. Correlazione di pixel adiacenti: da una media tra 90% e 100% nell'immagine originale si raggiunge anche senza alcuna iterazione del CA una gaussiana abbastanza stretta centrata in 0.
  2. Correlazione fra stessi pixel prima e dopo: gaussiane strette intorno a 0.
  3. Tuttavia, all'aumentare delle iterazioni del CA (History cresce) queste gaussiane non si stringono come verrebbe da ipotizzare. Rimangono inoltre uguali anche tra CA diversi. Spiegazione: se si perde correlazione è merito della mappa logistica, non dei CA.
- Sensibilità alla chiave: finalmente risultati non banali. (inserire spiegazione)


