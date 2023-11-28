* li $to, 3 (Присвоїти значення 3)
* blt $t0, $t1, label (Sprung) <
* bgt $to, $t1, label (Sprung) >
* jr $ra (Закінчення циклу)
* add $t0, &t1, &t2 (addition) (to - speichert value)
* addi $t0, &t1, 1
* lb $t2, 0(&t2) (loadbyte) (die Information von dieser Adresse in t2 speichern)
* beq $t0, &t1, label (equals)
* sb $t0, 0(&t1) (lb umgekehrt)
* j label
---

### **_(erste Aufgabe)_**

isdigit;

li $t0, 48 (load immediately)

li $t1, 57 (load immediately)

isdigit_if:

blt $a0, &t0, isdigit_else

bgt $a0, &t1, isdigital_else

li $v0, 1

jr $ra

isdigitelse:

li $v0, 0

jr $ra

### **_(zweite Aufgabe)_**

squeeze:

// li $t0, 0

add $t0,  &zero, &zero

add $t1,  &zero, &zero

---



s_for

add $t2, %a0, &t0

lb $t2, 0(&t2)

beq $t2, &zero, s_endfor

---

s_if:

beq $t2, &a1, s_endif

add $t3, &a0, &t1

sb $t2, 0(&t3)

addi &t1, &t1, 1

---

s_endif:

addi &to, &t0, 1

j s_for (jump, goto s_for)

---

s_endfor:

add &t3, &a0, &t1

sb %zero, o(&t3)

jr &ra

---
