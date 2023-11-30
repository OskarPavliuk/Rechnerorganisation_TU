[`Mc-test`](https://docs.freitagsrunde.org/Klausuren/Rechnerorganisation/ROrg_MC-Test_Gedaechtnisprotokoll_2020.pdf)

### **1 Aufgabe**


| A | B | Y |
| - | - | - |
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

Unsere Tabelle

Zuerst machen wir Operationen oben


| A | B | Xor (Gatter=1) |
| - | - | -------------- |
| 0 | 0 | 0              |
| 0 | 1 | 1              |
| 1 | 0 | 1              |
| 1 | 1 | 0              |

Danach machen wir Operationen unten


| A | nicht(B) | AND (Gatter &) |
| - | -------- | -------------- |
| 0 | 0, 1     | 0              |
| 0 | 1, 0     | 0              |
| 1 | 0, 1     | 1              |
| 1 | 1, 0     | 0              |

Verbinden wir beide Ergebnissen


| AND | XOR | Operation(?) = AND, XNOR, XOR, NAND |
| --- | --- | ----------------------------------- |
| 0   | 0   | 0, 1, 0, 1                          |
| 1   | 0   | 0, 0, 1, 1                          |
| 1   | 1   | 1, 0, 1, 0                          |
| 0   | 0   | 0, 1, 0, 1                          |

Nachdem wir unsere Berechnungen gemacht haben, können wir sehen, dass AND die einzige Lösung ist.

---

### **13 Aufgabe**

Gegeben ist die folgende Rechnung mittels Hornerschema. (wir gehen von unten nach oben) 14(10) = 1110(2)


| 1. | 14:2 = 7  | R0       |
| -- | --------- | -------- |
| 2. | 7:2 = 3   | R1       |
| 3. | 3:2 = 1   | RX (x=1) |
| 4. | (1:2 = 0) | R1       |
|    |           |          |

Wählen Sie alle korrekten Aussagen aus.

1. Die 4. Iteration/ der 4. Schritt ist notwendig zur Berechnung der Dezi- maldarstellung. - richtig :+1:
2. Der Platzhalter X, hat laut dem Algorithmus des Hornerschemas den Wert 0. - falsch :-1:
3. Die 4. Iteration/ der 4. Schritt ist nicht notwendig zur Berechnung der Dezimaldarstellung. - falsch :-1:
4. 14(10) = 1110(2) - richtig :+1:
5. 14(10) = 1011(2) - falsch :-1:
6. Der Platzhalter X, hat laut dem Algorithmus des Hornerschemas den Wert 1. - richtig :+1:

   **Die Antwort : 1,4,6**

---

### **11 Aufgabe**

Gegeben ist das neue Mikrofloat Format mit nur 14 Bits, wobei die Bits wie folgt verteilt sind:

Zusätzlich sind nun die folgenden 5 Zahlen gegeben:

1. 0 0101 000000000
2. 0 0101 010101010
3. 1 1010 010101010
4. 1 0101 010101010
5. 1 0101 000000000

Interpretieren Sie diesen im genannten Format und wa ̈hlen Sie die Antworten wo die Zahlen richtig geordnet sind.

a. 1>2>5>4>3

b. 2>1>4>3>5

c. 2>1>3>5>4

d. 1>2>3>5>4

e. 2>1>5>4>3 - **die richtige Antwort**

die Lösung:

Wir können vom Anfang sehen. dass 1 und 2 positiv Zahlen sind: dementsprechend -> 1,2 > oder 2,1 > {3,4,5}

1) E für (1) => 0101(2) = 5(10), bias = 2^(E(bits)-1)-1 = 2^3-1=7 -> E = e + bias, e= E - bias = 5 - 7 = -2;

**(-1)^(0) x 1,000000000 x 2^(-2)** = *приблизно 0.25*

2) E für (2) => dasselbe, e = -2; **(-1)^(0) x 1,010101010 x 2^(-2)** = *приблизно 0.252525*
3) E für (3) => 1010(2) = 10(10), bias = 7 -> e = E - bias = 10 - 7 = 3; **(-1)^(1) x 1,010101010 x 2^(3)** = *приблизно -8,08080808*
4) E für (4) => 0101 = 5, bias = 7; e = -2; **(-1)^(1) x 1,010101010 x 2^(-2)** = приблизно -0.252525
5) E für (5) => 0101 = 5, bias = 7; e = -2; **(-1)^(1) x 1,000000000 x 2^(-2)** = приблизно -0.25

#### **die Antwort: 2>1>5>4>3 = (e)**

---

### **2 Aufgabe**

Wie breit muss ein Steuersignal für einen Multiplexer mit 20 Eingangssignalen mindestens sein?

a. 5 bit

b. Das ist nicht möglich

c. 4 bit

d. 3 bit

die Lösung: 20 Eingangssignalen => 2^(x) = 20 => x = log2(20) => x = приблизно 4,32193.

Das bedeutet, dass unsere Antwort minimum 5 sein muss = **5 bit (a)**

---

### **3 Aufgabe**

Gegeben sind die folgenden Operationen mit 8 bit 2K-Zahlen.

Bei welchen der folgenden Möglichkeiten treten Fehler im Ergebnis auf, wenn dieses im gleichen Format gespeichert werden soll?

a. 0111 0111 + 0000 1100

b. 1000 1010 + 0010 0101

c. 1010 1111 + 1101 0011 - **Fehler**

d. 1000 0000 + 0010 1100

die Lösung:

8 bits = 256 die größte Zahl, die wir darstellen können.

1) Binärzahlen: 01110111 + 00001100 = 10000011; Als Dezimalzahlen: 119 + 12 = 131 (8 bits)
2) Binärzahlen: 10001010 + 00100101 = 10101111 ; Als Dezimalzahlen: 138 + 37 = 175 (8 bits)
3) Binärzahlen: 10101111 + 11010011 = 110000010; Als Dezimalzahlen: 175 + 211 = 386 **(9 bits Überlauf)**
4) Binärzahlen: 10000000 + 00101100 = 10101100; Als Dezimalzahlen: 128 + 44 = 172 (8 bits)

---

### _**4 Aufgabe**_

Was ist richtig? Ein Hochsprachenprogramm, z.B. in C, . . .

a). . . ist immer in englischer Sprache verfasst. (nicht obligatorisch) -> falsch :-1:

b). . . kann direkt auf einem Prozessor ausgeführt werden. (braucht Compiler oder Interpreter, muss Übersetzung gemacht werden) -> falsch :-1:

c). . . muss vor der Ausführung auf einem Prozessor zunächst in Maschinen- sprache umgewandelt werden. -> richtig :100:

d). . . läuft auf allen Prozessoren gleich schnell.

(Die Geschwindigkeit der Programmausführung hängt von verschiedenen Faktoren ab, einschließlich der Effizienz des Compilers, der Hardwarearchitektur des Prozessors und anderen Optimierungen.) -> falsch :-1:

---

### **_5 Aufgabe_**

Gegeben ist das neue Tinyfloat Format mit nur 14 Bits, wobei die Bits wie folgt verteilt sind:

Welchen Wert muss der Bias bei diesem Format haben, damit wie in den an- deren IEEE-754 Formaten kleine und große Zahlen gleich gut dargestellt werden ko ̈nnen?

a. 31

b. 7

c. 3

d. 15

**die Lösung: 14 Bits (1 bit Vorzeichen, 4 bits für bias, 9 bits für fraction) => bias = 2^(E(bits)-1)-1 = 2^(4-1)-1 = 2^(3) - 1 = 7.**

---
