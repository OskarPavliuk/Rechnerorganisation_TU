# Rechnerorganisation TU Berlin

## Kurze Zusammenfassung der Vorlesung woche 2 :bat:

[`Rechnerorganisation on isis`](https://isis.tu-berlin.de/course/view.php?id=35785)

[`TUB_cloud`](https://tubcloud.tu-berlin.de/s/YCGoWPgEYJQ6jY7)

**<code style='color: red;'>Grundlegende Gatter</code>**

![alt text](Bildschirmfoto%202023-11-04%20um%2011.58.47.png)

**<span style='color: red;'>Wahrheitstabellen</span>**

![alt text](Bildschirmfoto%202023-11-04%20um%2012.02.06.png)

**<span style='color: red;'>Weitere Gatter</span>**

![alt text](Bildschirmfoto%202023-11-04%20um%2012.08.08.png)

---
**<span style='color: green;'>Theorie:</span>**

Methoden:

- Wahrheitstabelle

- Disjunktive Normalform (Sum of products)
1) Disjunktion = ODER-Verknüpfung
2) Z = ( A*B ) + (¬A*B) = AB + ¬AB
- Konjunktive Normalform (Product of sums)
1) Konjunktion = UND-Verknüpfung
2) Z = (A+B)*(¬A+B)

---
**<span style='color: orange;'>Ableitung disjunktiven Normalform (DNF)</span>**

| A | B | Cin | Cout                                  | S                                   |
|---|---|-----|---------------------------------------|-------------------------------------|
| 0 | 0 | 0   | 0                                     | 0                                   |
| 0 | 0 | 1   | 0                                     | <span style='color: pink;'>1</span> |
| 0 | 1 | 0   | 0                                     | <span style='color: pink;'>1</span> |
| 0 | 1 | 1   | <span style='color: yellow;'>1</span> | 0                                   |
| 1 | 0 | 0   | 0                                     | <span style='color: pink;'>1</span> |
| 1 | 0 | 1   | <span style='color: yellow;'>1</span> | 0                                   |
| 1 | 1 | 0   | <span style='color: yellow;'>1</span> | 0                                   |
| 1 | 1 | 1   | <span style='color: yellow;'>1</span> | <span style='color: pink;'>1</span> |

*<span style='color: yellow;'>▪ Cout = ¬ABCin+A¬BCin+AB¬Cin+ABCin</span>*

*<span style='color: pink;'>▪ S = ¬A¬BCin+¬AB¬Cin+A¬B¬Cin+ABCin</span>*

---
**<span style='color: orange;'>Ableitung konjunktiven Normalform (KNF)</span>**

| A | B | F                                     |
|---|---|---------------------------------------|
| 0 | 0 | <span style='color: yellow;'>0</span> |
| 0 | 1 | 1                                     |
| 1 | 0 | <span style='color: yellow;'>0</span> |
| 1 | 1 | 1                                     |

_<span style='color: yellow;'>▪ F = (A+B)*(¬A+B)</span>_

---
**<span style='color: red;'>Boolesche Algebra (Zusammenfassung)</span>**

▪ Zwei Elemente: 0, 1

▪ Zwei binäre Verknüpfungen: UND (*), ODER (+)

▪ Eine unäre Verknüpfung: NICHT (¬)

▪ 8 Axiome:
- Neutrale Elemente: a·1 = a, a+0 = a
- Komplementäre Elemente: a·¬a =0, a+¬a =1
- Kommutativgesetze: a·b = b·a, a+b = b+a
- Distributivgesetze: (a + b)·c =a·c + b·c, a+(b·c) =(a+b)·(a+c)

▪ Bemerke: UND hat höhere Priorität als ODER
- a+b·c = a+(b·c)
---
**<span style='color: pink;'>Weitere Gesetze</span>**

**<span style='color: white;'>▪ Idempotenzgesetze</span>**
- a*a = a+a = a

**<span style='color: white;'>▪ Assoziativgesetze</span>**
- a*(b * c) = (a*b)*c
- a+(b+c) = (a+b)+c

**<span style='color: white;'>▪ De Morgansche Gesetze</span>**
- ¬(a+b) = ¬a*¬b
- ¬(a*b) = ¬a+¬b

**<span style='color: white;'>▪ Und viele mehr…</span>**
- a+(a * b) = a
- a*(a+b) = a
