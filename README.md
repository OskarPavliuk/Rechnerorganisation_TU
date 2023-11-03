# Rechnerorganisation TU Berlin

## Tutorium(Übung) woche 1 :white_check_mark:

[`Rechnerorganisation on isis`](https://isis.tu-berlin.de/course/view.php?id=35785)

[`TUB_cloud`](https://tubcloud.tu-berlin.de/s/YCGoWPgEYJQ6jY7)

*Erste Aufgabe* :white_check_mark:

```
1.1 Binärzahlen
Wandeln Sie die Zahl in das jeweils geforderte System um.
Setzen Sie dabei das Hornerschema und die Summenformel ein.
```
---
**a) 25 (10) → binär**

1) 25 / 2 = 12 Rest (1) - LSB;
2) 12 / 2 = 6 Rest (0)
3) 6 / 2 = 3 Rest (0)
4) 3 / 2 = 1 Rest (1)
5) 1 / 2 = 0 Rest (1) - MSB;

die Antwort schreiben wir von unten nach oben → `11001 (2)`; :heavy_check_mark:

---
**b) 293 (10) → binär**

Hier werden wir die Summenformel verwenden:

2^(8) = 256 -> 293 - 256 = 37;

2^(5) = 32 -> 37 - 32 = 5;

2^(2) = 4 -> 5 - 4 = 1;

2^(0) = 1 -> 1-1 = 0;


| 2^8 | 2^7 | 2^6 | 2^5 | 2^4 | 2^3 | 2^2 | 2^1 | 2^0 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| (1) | (0) | (0) | (1) | (0) | (0) | (1) | (0) | (1) |

die Antwort: `100100101 (2)`; :heavy_check_mark:

---
**c) 10111110 (2) → dezimal**

2^1 + 2^2 + 2^3 + 2^4 + 2^5 +2^7 = `190(10)`; :heavy_check_mark:

---
**d) 0x3F12 -> binär**

| 3    | F    | 1    | 2    |
|------|------|------|------|
| 0011 | 1111 | 0001 | 0010 |

die Antwort: `0011 1111 0001 0010 (2)`; :heavy_check_mark:

*wir gehen von links nach rechts*

---
**e)0101 1110 1001 0100 (2) -> (16)**

0x5 (14)    9   4 = die Antwort `5E94 (16)`; :heavy_check_mark:

---
**f)101111010010100(2) -> oktal**

````
Wir unterteilen unsere Sequenz in Gruppen von drei Elementen;
Was die umgekehrte Konvertierung betrifft, ist alles das Gleiche;
````
101 111 010 010 100 -> die Antwort `5 7 2 2 4 (8)` ; :heavy_check_mark:

572(8) -> die Antwort  `101 111 010 (2)` ; :heavy_check_mark:

---
*Zweite Aufgabe* :white_check_mark:

```
1.2 Zweierkomplementdarstellung
Wandeln Sie in das geforderte Format um.
```
---

**a) 37 (10) in 2k umwandeln**

37 (10) -> 100101 (2)
*Invertieren(1 step) und 1 addieren(2 step)*

 - 011010 (1 step)

 - 1(addieren) (2 step)
         
 - `011011` - die Antwort; :heavy_check_mark:
---

**b) -25 (10) in 2k umwandeln**

|25| Betrag in binär = 011001(2)

*Invertieren(1 step) und 1 addieren(2 step)*

- 100110 (1k) (1 step)
- 1(addieren) (2 step)
- `100111(2k)` - die Antwort; :heavy_check_mark: 

---
**c)10010111 (2k) in dezimal**

die Antwort -128 + 16 + 4 + 2 + 1 = `-105(10)`; :heavy_check_mark:

---
**d) 00101010(2k) ind dezimal**

die Antwort  32 + 8 + 2 = `42 (10)`; :heavy_check_mark: 

---
**e) Addition**

10011110 + 1111011 = 100011001 (2k) Überlauf :heavy_check_mark:
````
die Regeln für Addition:
- 1 + 1 + 1 = 11;
- 1 + 1 = 10;
- 10 - 1 = 1;
````

---
**f) Division**

110110 / 11 =  die Antwort `10010(2)`; :heavy_check_mark:
````
Wir teilen die Zahlen in eine Spalte auf
````





