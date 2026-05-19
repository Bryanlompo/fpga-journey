# MUX_2x1-VHDL

## Description
Un MUX 2x1 est un circuit combinatoire qui prend deux entrées 
et donne une sortie en fonction d'un sélecteur.
S=0 → Y=A  |  S=1 → Y=B

## Compétences démontrées
instruction when/else en vhdl.
Testbench multi-valeurs avec wait for
STD_LOGIC vs STD_LOGIC_VECTOR 

## Fichiers
| Fichier | Description |
|---|---|
| design.vhd | Le composant multiplexeur |
| testbench.vhd | Le testbench de simulation |
| waveform.png | Screenshot des waveforms EPWave |

## Résultats de simulation
| S | A | B | Y attendu | Y obtenu | Statut |
|---|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0| ✓ |
| 0 | 1 | 0 | 1 | 1 | ✓ |
| 1 | 0 | 0 | 0 | 0 | ✓ |
| 1 | 0 | 1 | 1 | 1 | ✓ |

## Outils utilisés
EDA Playground (simulation en ligne)
GHDL 5.1.1 (compilateur VHDL)
EPWave (visualisation des waveforms) 

## Prochaine étape
Pour la prochaine étape — c'est le MUX 4:1 en structural.
