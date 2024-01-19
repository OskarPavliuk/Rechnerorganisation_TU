# Copyright (c) 2024 Oskar Pavliuk
# For license information, see LICENSE

test_numeral: .asciiz "MMMCMXCIX"
# Test-Eingaben:
# III
# L
# XI
# XIV
# CLXXXIV
# DCCXLVI
# MMMCMXCIX
.text

roman:
    addi $sp, $sp, -20  # Reservieren von 20 Bytes auf dem Stack fuer die gespeicherten Register
    sw $ra, 0($sp)      # Speichern der Rueckkehradresse auf dem Stack
    sw $s0, 4($sp)      # Speichern des aktuellen Werts von $s0 auf dem Stack
    sw $s1, 8($sp)      # Speichern des aktuellen Werts von $s1 auf dem Stack
    sw $s2, 12($sp)     # Speichern des aktuellen Werts von $s2 auf dem Stack
    sw $s3, 16($sp)     # Speichern des aktuellen Werts von $s3 auf dem Stack

    move $s0, $a0       # Kopieren des Zeigers auf die roemische Zahl in $s0
    li $s3, 0           # Eine Variable zum Speichern der Gesamtsumme

reihenfolge:
    lb $t0, 0($s0)      # Laden des aktuellen Zeichens der roemischen Zahl in $t0
    beqz $t0, end       # Wenn nichts vorhanden ist, gehen wir zu "end"

    move $a0, $t0       # Kopieren des Zeichens in $a0 zur Verwendung in "romdigit"
    jal romdigit        # Wir rufen die Hilfsfunktion "romdigit" auf
    move $s1, $v0       # Speichern des Ergebnisses von "romdigit" in $s1

    addi $s0, $s0, 1    # Inkrementieren des Zeigers, um zum naechsten Zeichen zu gelangen
    lb $t1, 0($s0)      # Laden des naechsten Zeichens in $t1
    beqz $t1, addition  # Falls das naechste Zeichen "null" ist, dann gehen wir zu "addition"

    move $a0, $t1       # Kopieren des naechsten Zeichens in $a0 zur Verwendung in "romdigit"
    jal romdigit        # Wir rufen die Hilfsfunktion "romdigit" auf
    move $s2, $v0       # Speichern des Ergebnisses von "romdigit" in $s2

    blt $s1, $s2, subtraction  # Falls der Wert von $s1 kleiner als $s2 ist, gehen wir zu "subtraktion"
    bge $s1, $s2, addition     # Falls der Wert von $s1 groeser als $s2 oder gleich $s2 ist, gehen wir zu "addition"

subtraction:
    sub $s1, $s2, $s1      # Wir subtrahieren den Wert von $s1 vom Wert von $s2 und speichern ihn im Register $s1
    addi $s0, $s0, 1       # Inkrementieren des Zeigers, um zum naechsten Zeichen zu gelangen

addition:
    add $s3, $s3, $s1      # Wir addieren den Wert von $s1 zur Summe
    j reihenfolge          # Wir kehren zur "reihenfolge" zurueck

end:
    move $v0, $s3          # Kopieren der Gesamtsumme in das Rueckgaberegister $v0

    lw $ra, 0($sp)         # Laden der Rueckkehradresse vom Stack
    lw $s0, 4($sp)         # Wiederherstellen des Werts von $s0 vom Stack
    lw $s1, 8($sp)         # Wiederherstellen des Werts von $s1 vom Stack
    lw $s2, 12($sp)        # Wiederherstellen des Werts von $s2 vom Stack
    lw $s3, 16($sp)        # Wiederherstellen des Werts von $s3 vom Stack
    addi $sp, $sp, 20      # Freigeben des reservierten Speichers auf dem Stack
    jr $ra