# Additionneur 4 bits — VHDL

## Description
Additionneur combinationnel 4 bits implémenté en VHDL behavioral.
Prend deux entrées A et B de 4 bits et produit une somme SUM de 4 bits.

## Compétences démontrées
- Structure entity / architecture en VHDL
- Utilisation des types STD_LOGIC_VECTOR
- Écriture d'un testbench complet avec simulation temporelle
- Debug et lecture de waveforms sur EPWave / GHDL

## Fichiers
| Fichier | Description |
|---|---|
| design.vhd | Le composant additionneur |
| testbench.vhd | Le testbench de simulation |

## Résultats de simulation
| A        |       B  |SUM attendu|SUM obtenu| Statut |
|---       |---       |---        |---       |---     |
| 3 (0011) | 1 (0001) | 4 (0100)  | 4 (0100) |      ✓ |
| 5 (0101) | 2 (0010) | 7 (0111)  | 7 (0111) |      ✓ |
| 8 (1000) | 7 (0111) | 15 (1111) | F (1111) |      ✓ |

## Outils utilisés
- EDA Playground (simulation en ligne)
- GHDL 5.1.1 (compilateur VHDL)
- EPWave (visualisation des waveforms)

## Prochaine étape
Décodeur 7 segments — afficher un chiffre hexadécimal sur un display physique.
