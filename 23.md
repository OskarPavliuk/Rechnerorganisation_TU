### 1. Aus welchen zwei Komponenten besteht eine CPU?

o Speicher und Festplatte

o Speicher und Leitwerk

o Datenpfad und Leitwerk

**die Antwort:**

---



### 2. Die binäre Gleitkommazahl α ist in halblogarithmischer Darstellung gegeben:

α = 1,00111011 * 2^(10)

Wandeln Sie α in das bekannte IEEE 754 Minifloat-Format um:


| S     | E      | F       |
| ----- | ------ | ------- |
| 1 bit | 5 bits | 10 bits |

e = 10;

bias = (2^(E-1))-1 = 2^(4) - 1 = 15;

E = e + bias = 10 + 15 = 25; 11001(2) = E;

**_die Antwort:**_ **_=> S = 0 (positiv), E = 11001(2), F = 00111011._**

---



### 4. Welche Bitfolge repräsentiert den Dezimalwert -9 in 8-Bit Einerkomplement Darstellung (1k)?

Betrag von -9 es ist 9 => 00001001.

Danach invertieren die Zahl = **_11110110_**

---



### 5. Die Dezimalzahl 1550 soll per Hornerschema in eine Hexadezimalzahl umgewandelt werden. Welche Rechnung muss im zweiten Schritt erfolgen?


| Schritt | Division   | Rest |
| ------- | ---------- | ---- |
| 1       | 1550:16=96 | R 14 |
| 2       | ????       | ???  |

96:16 = 16 Rest = 0

### 7. 𝒀=(𝑨⊕𝑩)⨁(𝑩+nicht(𝑪))

Wählen Sie die disjunktive Normalform (DNF) von Y aus:


| A | B | C | A xor B | nicht C | B + nicht C | xor |
| - | - | - | ------- | ------- | ----------- | --- |
| 0 | 0 | 0 | 0       | 1       | 1           | 1   |
| 0 | 0 | 1 | 0       | 0       | 0           | 0   |
| 0 | 1 | 0 | 1       | 1       | 1           | 0   |
| 0 | 1 | 1 | 1       | 0       | 1           | 0   |
| 1 | 0 | 0 | 1       | 1       | 1           | 0   |
| 1 | 0 | 1 | 1       | 0       | 0           | 1   |
| 1 | 1 | 0 | 0       | 1       | 1           | 1   |
| 1 | 1 | 1 | 0       | 0       | 1           | 1   |

DNF = (nichtA * nichtB * nichtC) + (A * nichtB * C) + (A * B * nichtC) + (ABC)

DNF(2) = AC + (A * B * nichtC) + (nichtA * nichtB * nichtC)

### 10. Wählen Sie die zum abgebildeten Schaltnetz passende Wahrheitstabelle aus.

**_die Antwort_**


| a | b | a + b | nicht(a*b) | nicht((a+b) * nicht(a*b)) = q | nicht(nicht(a*b)) = a * b = r |
| - | - | ----- | ---------- | ----------------------------- | ----------------------------- |
| 0 | 0 | 0     | 1          | 1                             | 0                             |
| 0 | 1 | 1     | 1          | 0                             | 0                             |
| 1 | 0 | 1     | 1          | 0                             | 0                             |
| 1 | 1 | 1     | 0          | 1                             | 1                             |

### 11. Die boolesche Funktion 𝒚 prüft, ob sich bei der 3 Bit breiten vorzeichenlosen Binärzahl 𝒙 um eine Primzahl handelt.

Die Wahrheitstabelle ist gegeben:


| x2 | x1 | x0 | y |
| -- | -- | -- | - |
| 0  | 0  | 0  | 0 |
| 0  | 0  | 1  | 0 |
| 0  | 1  | 0  | 1 |
| 0  | 1  | 1  | 1 |
| 1  | 0  | 0  | 0 |
| 1  | 0  | 1  | 1 |
| 1  | 1  | 0  | 0 |
| 1  | 1  | 1  | 1 |

DNF = (nicht x2 * x1 * **nicht x0**) + (nicht x2 * x1 * **x0**) + (x2 * **nicht x1** * x0) + (x2 * **x1** * x0)

DNF(2) = (nicht x2 * x1) + (x2 * x0);
