# Rechnerorganisation TU Berlin

## Aufgabenblatt 2  :white_check_mark:

[`Rechnerorganisation on isis`](https://isis.tu-berlin.de/course/view.php?id=35785)

[`TUB_cloud`](https://tubcloud.tu-berlin.de/s/YCGoWPgEYJQ6jY7)

---

### **_Gleitkommazahlen_**

2.1 Minifloat-Format

Gegeben sind die folgenden Zahlen in Dezimal bzw. IEEE 754 Minifloatdarstellung

die Aufgabe: Wandeln Sie alle Zahlen in die jeweils andere Darstellung um.

a) 6,8 (10) -> `110,1100`

0,8 * 2 = 0,6 + 1;

0,6 * 2 = 0,2 + 1;

0,2 * 2 = 0,4 + 0;

0,4 * 2 = 0,8 + 0;

0,8 * 2 = 0,6 + 1; (Schleife)

wir gehen von oben nach unten

a.1) 1,101100 * 10^(2); e = 2, weil zwei nach links;

a.2) Bruch, alles was nach dem Komma geht = 101100 ... (Schleife)
23 Bits Insgesamt

a.3) E = e + bias = 2 + 127 = 129 (10); 10000001(2);

### **_die Antwort:_**


| 0 = s | 10000001 | 101100 101100 101100 10110 |
| ----- | -------- | -------------------------- |

Alles richtig, überprüft; :+1:

---

c) 9,51178 (10) -> `1001,10000011000001000000... (2)`

0,51178 * 2 = 0,02356 + 1;

0,02356 * 2 = 0,04712 + 0;

0,04712 * 2 = 0,09424 + 0;

0,09424 * 2 = 0,18848 + 0;

0,18848 * 2 = 0,37696 + 0;

0,37696 * 2 = 0,75392 + 0;

0,75392 * 2 = 0,50784 + 1;

0,50784 * 2 = 0,01568 + 1;

0,01568 * 2 = 0,03136 + 0;

0,03136 * 2 = 0,06272 + 0;

0,06272	* 2 = 0,12544 + 0;

0,12544	* 2 = 0,25088 + 0;

0,25088	* 2 = 0,50176 + 0;

0,50176	* 2 = 0,00352 + 1;

0,00352	* 2 = 0,00704 + 0;

0,00704	* 2 = 0,01408 + 0;

0,01408	* 2 = 0,02816 + 0;

0,02816	* 2 = 0,05632 + 0;

0,05632	* 2 = 0,11264 + 0;

0,11264	* 2 = 0,22528 + 0;

0,22528	* 2 = 0,45056 + 0; ...

wir gehen von oben nach unten

c.2) 1,00110000011000001000000 * 2^(3), e = 3, weil drei nach links;

c.3) E = e + bias = 3 + 127 = 130 (10); 10000010(2);

### **_die Antwort:_**


| 0 = s | 10000010 | 00110000011000001000000 |
| ----- | -------- | ----------------------- |

Alles richtig, überprüft; :+1:

---

b) -4,1875 (10) -> `100,0011`

0,1875 * 2 =  0,3750 + 0;
0,3750 * 2 = 0,750 + 0;
0,75   * 2 = 0,50 + 1;
0,5    * 2 = 0,0 + 1;

von oben nach unten

b.2) 1,000011 * 2^(2); e = 2; weil, zwei nach links

b.3) E = e + bias = 2 + 127 = 129 (10); 10000001(2);

### **_die Antwort:_**


| 1 = s | 10000001 | 00001100000000000000000 |
| ----- | -------- | ----------------------- |

Alles richtig, überprüft; :+1:

---

d)

Minifloat 16 Bit

1 Bit, 5 Bit; 10 Bit


| 1 = s | 01011 | 1010100000 |
| ----- | ----- | ---------- |

d.1) s = 1 → die Zahl ist negativ (-);

d.2) Exponent = 01011, in binärzahl → 11;

E = e + bias = e + 15 = 11; e = -4;

`1,1010100000 (2)` = Mantisse um führendes "1," erweitern;

Als nächstes muss das Komma so weit verschoben werden, dass der Exponent 0 wird.
Wenn der Exponent größer als 0 ist, muss das Komma nach rechts verschoben werden, ansonsten nach links.

1,1010100000 * 2^(-4) =  die Antwort ist -(1+1/2+1/8+1/32)*2^(-4) = -0,103515625 (10) (da s=-1 (dezimal);

---

2.2 Addition von Gleitkommazahlen

**b)** 101,011110011(2) (5,474609375(10)) und 11000,10000101(2) (24,51953125(10))

Normalisieren und Anpassung an 16-Bit-Format:

A) 1,01011110011 * 2^(2);

B) 1,100010000101 * 2^(4);

A.1) 0.0101011110011 * 2^(4);

B)   1,100010000101 * 2^(4);

Addition:

0.010101111001 +

1.100010000101 +

1.110111111110 * 2^(4) = - _**die Antwort**_

`11101.11111110` = 29. 2^(-1) + ... + 2^(-7); 2,49219 = (319/128)

---

_**Kurze Beschreibung des Algorithmus für Transformationen**_

**_dezimal zu IEEE-754_**

1.0 Vorzeichenbit bestimmen;

- Wenn die Zahl positiv ist, wird in das Vorzeichenbit eine 0 geschriebe und wenn sie negativ ist eine 1.

1.1 Zahl in Binärzahl umwandeln;

1.2 Komma so verschieben, dass vor dem Komma nur noch eine 1 steht;

- Das Komma muss so verschoben werden, dass vor dem Komma genau eine 1 steht und sonst nichts mehr.
- Der Exponent wird entsprechend angepasst.

1.3 zum Exponentwert Bias hinzuaddieren;

- Als nächstes muss zum Wert vom Exponenten der Bias hinzuaddiert werden.
- Im Fall von einfacher Genauigkeit (32 Bit) beträgt der Bias 127.

1.4 den Exponent in das Binärsystem umwandeln;

1.5 Gleitkommazahl zusammensetzen;

---

_**IEEE-754 zu dezimal**_

1.0 Exponent in dezimal umrechnen;

1.1 vom Exponenten den Bias abziehen;

1.3 Mantisse um führendes "1," erweitern;

1.4 Komma verschieben;

- Als nächstes muss das Komma so weit verschoben werden, dass der Exponent 0 wird.
- Wenn der Exponent größer als 0 ist, muss das Komma nach rechts verschoben werden, ansonsten nach links.

1.5 Mantisse in Dezimalzahl umwandeln;

1.6 Vorzeichen bestimmen;

---
