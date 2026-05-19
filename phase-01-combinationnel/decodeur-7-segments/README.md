  # Décodeur 7 Segments — VHDL

## Description
Circuit combinationnel qui prend une entrée de 4 bits (DIGIT)
et produit une sortie de 7 bits (SEG). Chaque bit de sortie
correspond à un segment physique de l'afficheur (a,b,c,d,e,f,g).
Permet d'afficher les chiffres 0 à 9 et les lettres A à F
en allumant les bons segments selon la valeur en entrée.

## Compétences démontrées
- Instruction case / when en VHDL
- Process combinationnel avec liste de sensibilité
- Mappage d'une table de vérité en code HDL
- Conversion hexadécimal → binaire pour vérifier les résultats
- Testbench multi-valeurs avec wait for

## Fichiers
| Fichier | Description |
|---|---|
| design.vhd | Le composant décodeur |
| testbench.vhd | Le testbench de simulation |

## Résultats de simulation
| DIGIT | Valeur | SEG (hex) | SEG (binaire) | Statut |
|---|---|---|---|---|
| 0000 | 0 | 7e | 1111110 | ✓ |
| 0011 | 3 | 79 | 1111001 | ✓ |
| 0101 | 5 | 5b | 1011011 | ✓ |
| 1000 | 8 | 7f | 1111111 | ✓ |

## Outils utilisés
- EDA Playground (simulation en ligne)
- GHDL 5.1.1 (compilateur VHDL)
- EPWave (visualisation des waveforms)

## Prochaine étape
MUX 2:1 — introduire la sélection conditionnelle
entre deux entrées selon un signal de contrôle.
