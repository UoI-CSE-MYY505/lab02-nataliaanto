
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1

prog:

    li s0, 0    #arxikopoihsh tou s0=0 
    beqz a1, done   

    li t0, 4   #kathe leksi exei megethos 4 bytes            

search_loop:

    lw t1, 0(a0)              #fortwse th leksi apo th dieythinsi a0 ston t1
    beq t1, a2, match_found   #an tostoixeio ston t1 tairiazei me ton  a2 pigaine sthn match_found
    add a0, a0, t0            #prosthetoume 4 gia na metaboume sthn epomenh leksi 
    addi a1, a1, -1           #meiwse to plithos twn stoixeiwn kata 1
    bnez a1, search_loop      #an yparxoyn akoma stoixeia epanelave ton vrogxo 
    j done                    #telos anazitisis pigaine ston done

match_found:

    mv s0, a0                 #apothikeysh ths dieuthinsis ston a0
    add a0, a0, t0            #prosthetoume 4 gia na metavoume sthn epomenh leksi
    addi a1, a1, -1           #meiwse to plithos kata 1
    bnez a1, search_loop      #an yparxoun akoma stoixeia epanelave ton vrogxo

done:
    addi a7, zero, 10  #telos programmtos
    ecall
