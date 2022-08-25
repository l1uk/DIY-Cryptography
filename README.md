# GOL
Esploriamo le applicazioni della caoticità degli automi cellulari alla crittografia.

## Presentazione

### Automi cellulari

- *Q: Che cos'è un automa cellulare?*\
A: Storia, a partire da von Neumann
- *Q: Quali sono i più semplici automi?*\
A: Automi elementari (ECA)
- *Q: In che senso un automa è caotico?*\
A: Utile la classificazione di Wolfram
- *Q: Esistono automi elementari Turing-completi?*\
A: In Rule 110 astronavi emulano un "cyclic tag system"
- *Q: Il più celebre automa, Life, è Turing-completo?*\
A: Sì, glider emulano segnali e porte logiche
- *Q: Qual'è l'automa più caotico?*\
A: Fredkin, grazie a metriche di caoticità

### Crittografia

- *Q: Come si cripta un'immagine?*\
A: Struttura dell'algoritmo, permutazione e diffusione
- *Q: Che ruolo gioca Life in questo?*\
A: Generazione della permutazione
- *Q: Come si misura la bontà dell'algoritmo?*\
A: Test di correlazione e di sensibilità alla chiave
- *Q: Quali sono i risultati?*\
A: Basso contributo entropico di Life, algoritmo lento
- *Q: Come si spiegano i risultati positivi dell'articolo?*\
A: Forte contributo entropico di altri step dell'algoritmo

## Algoritmo

Encrypter.m disordina i pixel di un'immagine a partire da una password, costituita ancora dai parametri di una mappa logistica. 

La password genera una configurazione iniziale di un automa cellulare, che viene fatta evolvere, e l'intera storia dell'automa viene usata per permutare i pixel secondo Permute.m.

Successivamente si effettuano dei test statistici di correlazione tra immagini iniziali e finali, e di sensibilità dell'immagine criptata rispetto a un piccolo cambiamento nella password.

### Risultati test algoritmo originario
- Algoritmo originale
  - Test di correlazione:
    1. Correlazione di pixel adiacenti: da una media tra 90% e 100% nell'immagine originale si raggiunge anche senza alcuna iterazione del CA una gaussiana abbastanza stretta centrata in 0.
    2. Correlazione fra stessi pixel prima e dopo: gaussiane strette intorno a 0.
    3. Tuttavia, all'aumentare delle iterazioni del CA (History cresce) queste gaussiane non si stringono come verrebbe da ipotizzare. Rimangono inoltre uguali anche tra CA diversi. Spiegazione: se si perde correlazione è merito della mappa logistica, non dei CA.
  - Sensibilità alla chiave: finalmente risultati non banali. (inserire spiegazione)

### Nuovo algoritmo
- L'algoritmo tiene traccia del primo istante in cui una cella è viva nel CA
- Tuttavia dopo ~10 iterazioni il 95% delle celle si sarà già acceso una volta
- Pertanto allungare il numero di iterazioni non migliora l'algoritmo
- Soluzione: nuovo algoritmo con reset periodico
  1. Genera stato iniziale
  2. Evolvi lo stato per numero fissato di iterazioni
  3. Permuta l'immagine usando la storia
  4. Ripeti per numero fissato di reset i punti 2 e 3 resettando la storia
- Predizione: 10 iterazioni per 10 reset darà correlazione minore di 100 iterazioni senza reset

