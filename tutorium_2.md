# Rechnerorganisation TU Berlin

## Gleitkommazahlen (floating point) woche1

[`Rechnerorganisation on isis`](https://isis.tu-berlin.de/course/view.php?id=35785)

[`TUB_cloud`](https://tubcloud.tu-berlin.de/s/YCGoWPgEYJQ6jY7)

***
Näherung für reelle Zahlen: (-1)^(s) x 1.f x 2^(e)

– s: **_Vorzeichen_** (sign): 0 → positiv, 1 → negativ

– 1.f: **_Mantisse_** (Betrag, significand) als _**normalisierte Zahl**_

    • Zahl wird so lange geschoben, bis sie führende 1 aufweist
    • Binärpunkt wird rechts von dieser 1 festgelegt (1.0 < 1.f < 2.0)
– f: nur der **_Bruch f_** (fraction) wird gespeichert, **_führend_**e 1 ist implizit (wird von Recheneinheit ergänzt)
***

– e: vorzeichenbehafteter Exponent, wird als **_transformierter Exponent E_** gespeichert

– E: E = e + bias

    • bias wird so gewählt, dass 2-Komplement-Zahl e zur
    vorzeichenlosen Dualzahl E wird
    • bias entweder bei einfacher Genauigkeit 127 oder 1023 bei
    doppelter Genauigkeit (double)
***

_**▪ Einfache Genauigkeit (single precision, 32 Bit)**_

| 1 bit | 8 bit | 23 bit |
|-------|-------|--------|
| s     | E     | f      |

bias = 127

C/Java: float

– E=0 / 255 (dienen als Sonderfälle)
***
**_▪ Doppelte Genauigkeit (double precision, 64 Bit)_**

| 1 bit | 11 bit | 52 bit |
|-------|--------|--------|
| s     | E      | f      |

bias = 1023

C/Java: double
***
### **_Beispiel (I)_**

▪ -0,75D mit einfacher Genauigkeit

- s = 1 (`da wir negative Zahl haben`)
- 0,75(D) als gebrochene Dualzahl ist 0,11(B)
````
1) 0,75 => 0,75 * 2 = 0,5 + 1;
2) 0,5 * 2 = 0 + 1;
die Antwort: 0,11 (wir gehen von oben nach unten)
````
- Normalisiere: 0,11 = 1,1 x 2^(-1);
````
Normalisiere: (wir müssen erste 1 treffen)
````
• führende 1 ist implizit → Bruch = 10000....
````
Bruch - es ist das, was wir nach dem Komma haben
1,1 x 2^(-1) -> ...,1(00000) genauer gesagt
````
– Transformierter Exponent E

E = e + bias = -1 + 127 = 126 = 0111 1110(B)

````
unsere Zahl x 2^(-1) = unsere Zahl x 2^(e) -> e = -1;
bias = 127 (default)
````
#### **_die Antwort:_**
| 1 = s (1 Bit insgesamt) | 0111 1110 (8 Bit insgesamt) | 10000000000000000000000 (23 Bit insgesamt) |
|-------------------------|-----------------------------|--------------------------------------------|
***
### **_Beispiel (2)_**
▪ 0,075D mit einfacher Genauigkeit

– s = 0 (da wir positive Zahl haben)
– 0,075D als gebrochene Dualzahl ist 0,0001 0011 0011 0011 0011...B
```
1) 0,075 => 0,075 * 2 = 0,15 + 0;
2) 0,15 * 2 = 0,3 + 0;
3) 0,3 * 2 = 0,6 + 0;
4) 0,6 * 2 = 0,2 + 1;
5) 0,2 * 2 = 0,4 + 0;
6) 0,4 * 2 = 0,8 + 0;
7) 0,8 * 2 = 0,6 + 1;
8) 0,6 * 2 = 0,2 + 0;
9) wir haben von diesem Moment die Schleife
```
– Normalisiere: 0,00010011 = 1,0011 x 2^(-4)
```
Normalisiere: (wir müssen erste 1 treffen)
Wir machen eine Verschiebung um 4 nach rechts
```
• führende 1 ist implizit → Bruch = 0011.... + Schleife bis 23 bits
````
Alles, was nach dem Komma geht ...,0011
````

– Transformierter Exponent E

E = e + bias = -4 + 127 = 123 = 0111 1011(B)
````
unsere Zahl x 2^(-4) = unsere Zahl x 2^(e) -> e = -4;
bias = 127 (default)
````
#### **_die Antwort:_**
| 0 = s (1 Bit insgesamt) | 0111 1011 (8 Bit insgesamt) | 00110011001100110011001 (23 Bit insgesamt) |
|-------------------------|-----------------------------|--------------------------------------------|
***
#### **_Addition von  Gleitkommazahlen_**

Beispiel basiert auf 16-Bit **_Minifloat_** Format

Z = X + Y mit
- X = 2,35 (D) = 10.0101 1001 1001 1001 ... (B)
- Y = 10,17 (D) = 1010.0010 1011 1000 0101 ... (B)

Normalisieren und Anpassung an 16-Bit-Format:
- X = 1.0010 1100 11 * 2^(1);
- Y = 1.0100 0101 01 * 2^(3);

```
Ідемо наліво до першої одиниці
- X = 10.0101 ... -> 1.00101 ... (nach links um eine Position)
- Y = 1010.0010 ... -> 1.0100010 ... (nach links um vier Positionen)
```

– Vergleichen der beiden Exponenten e.

– Bei Ungleichheit kleineren Exponent an den größeren anpassen

– X = **0.0**100 1011 00 11 · 2^(3) - кінцевий результат(+ два нулі на початок)

nächster Schritt:
– Addieren der Mantissen:

  0.0100 1011 00 (X) (+)

  1.0100 0101 01 (Y) (+)

  1.1001 0000 01 (Z) (=)
  
#### **_die Antwort: Z = 1.1001 0000 01 · 2^(3)_**

Nach der Berechnungen = 12,500 975 656 2510 (korrekt wäre: 12,52).
***
