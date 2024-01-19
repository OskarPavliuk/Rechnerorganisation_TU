# Copyright (c) 2024 Oskar Pavliuk
# For license information, see LICENSE

test_msg: .asciiz ".... .- .-.. .-.. ---"
# Test-Eingaben:
# .... .- .-.. .-.. ---
# -- .. .--. ...  .. ... -  - --- .-.. .-..
# .---- .-.-. .---- -...- ..---
.text

morse:
    li $t7, 0   #  Variable fuer die Baumdurchquerung
    li $t8, 0   #  Indikator zur Verfolgung des zweiten Leerzeichens
    li $t9, 0   #  Ein Indikator, um zu ueberpruefen, ob am Eingang eine Morse_Nachricht vorliegt

    move $t0, $a0  # Variable, die fuer die erforderlichen Symbole im decoder_heap verantwortlich ist
    move $t1, $a1  # Variable, die fuer "morse_in" verantwortlich ist
    move $t2, $a2  # Variable, die fuer das Schreiben unserer Baumelemente in text_out verantwortlich ist
    move $t3, $v0  # Variable zum Zaehlen der Anzahl dekodierter Symbole

verzweigung:       # Lesen und Vergleichen von Symbolen
    lb $t4, 0($t1) # Wir laden das Symbol von morse_in
    beqz $t4, end  # Wenn kein Symbol vorhanden ist (""), gehen wir zum Label "end"
    li $t9, 1      # Wenn morse_in nicht leer ist, wird unser Indikator 1
    beq $t4, 32, leerzeichen # Wenn das Symbol aus morse_in gleich einem Leerzeichen ist, dann gehen wir zu "leerzeichen"
    li $t8, 0                # Wir setzen den Indikator auf 0, wenn bereits zwei Leerzeichen vorhanden waren
    beq $t4, 46, link        # Wenn das Symbol von morse_in einem Punkt entspricht, gehen wir zu "link"
    beq $t4, 45, recht       # Wenn das Symbol von morse_in einem Strich entspricht, gehen wir zu "recht"

link:                        # Linker Zweig
    sll $t7, $t7, 1          # k: = 2k
    addi $t7, $t7, 1         # k: = 2k + 1, Wir waehlen den linken Kindknoten des aktuellen Knotens aus
    addi $t1, $t1, 1         # morse_in + 1, Wir gehen zum naechsten Symbol
    j verzweigung            # Wir kehren zur "verzweigung" zurueck

recht:                       # Rechter Zweig
    sll $t7, $t7, 1          # k: = 2k
    addi $t7, $t7, 2         # k: = 2k + 2,  Wir waehlen den rechten Kindknoten des aktuellen Knotens aus
    addi $t1, $t1, 1         # morse_in + 1, Wir gehen zum naechsten Symbol
    j verzweigung            # Wir kehren zur "verzweigung" zurueck

leerzeichen:
    bnez $t8, zweites_leerzeichen   # Wenn wir bereits ein Leerzeichen haben, gehen wir zu "zweites_leerzeichen"
    li $t8, 1                # Wenn wir nicht zu "zweites_leerzeichen" gegangen sind, wird unser Indikator 1
    add $t5, $t7, $t0        # $t5 = decoder_heap[$t7]
    lb $t6, 0($t5)           # Wir laden das Symbol in ($t6)
    sb $t6, 0($t2)           # Wir schreiben das Zeichen in "text_out"
    addi $t2, $t2, 1         # Array text_out + 1
    addi $t3, $t3, 1         # die Anzahl der decodierten Zeichen + 1
    li $t7, 0                # k = 0, Wir setzen unseren Array-Index auf den Wurzelknoten zurueck
    addi $t1, $t1, 1         # morse_in + 1, Wir gehen zum naechsten Symbol
    j verzweigung            # Wir kehren zur "verzweigung" zurueck

zweites_leerzeichen:
    li $t7, 0                # k = 0, Wir setzen unseren Array-Index auf den Wurzelknoten zurueck, um das benoetigte Zeichen "_" zu erhalten
    li $t8, 0                # Wir setzen die Variable zur Verfolgung des zweiten Leerzeichens auf 0 zurueck
    lb $t6, 0($t0)           # Wir laden das Symbol "_" in ($t6)
    sb $t6, 0($t2)           # Wir schreiben das Zeichen in "text_out"
    addi $t2, $t2, 1         # Array text_out + 1
    addi $t3, $t3, 1         # die Anzahl der decodierten Zeichen + 1
    addi $t1, $t1, 1         # morse_in + 1, Wir gehen zum naechsten Symbol
    j verzweigung            # Wir kehren zur "verzweigung" zurueck

end:
    beqz $t9, total_end      # Wenn keine Zeichen gefunden wurden, springen wir zu "total_end"
    add $t5, $t7, $t0        # $t5 = decoder_heap[$t7]
    lb $t6, 0($t5)           # Wir laden das letzte Symbol in ($t6)
    sb $t6, 0($t2)           # Wir schreiben das letzte Zeichen in "text_out"
    addi $t3, $t3, 1         # die Anzahl der decodierten Zeichen + 1

total_end:
    move $v0, $t3            # Wir kopieren der Anzahl dekodierter Symbole in das Rueckgaberegister $v0
    sb $zero, 1($t2)         # Wir setzen am Ende von text_out einen Nullterminator ('\0')
    jr $ra
