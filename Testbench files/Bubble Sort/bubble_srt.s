# processor code for bubble sort:

# load a set of ten integers from into stack
ldsp 1000(R0) # load the stack pointer to point to 1000th memory location 
# load the numbers into the stack say the numbers start from the 0th position
push 0(R0)  # at location 1000
push 4(R0)  # at location 1004
push 8(R0)  # at location 1008
push 12(R0) # ...
push 16(R0)
push 20(R0)
push 24(R0)
push 28(R0)
push 32(R0)
push 36(R0)

move R1, R0 # R1 = i = 0
move R2, R0 # R2 = j = 0
br out_loop

swap:
    # swap a[j] with a[j+1]
    st 0(R6), R9    # a[j] = a[j+1]
    st 0(R7), R8    # a[j+1] = a[j]
    addi R2, R2, 1  # j++
    br in_loop

out_loop:
    subi R3, R1, 10 # check t = i-n == 0?
    bz R3, output 
    move R2, R0     # j = 0
    addi R1, R1, 1  # i++, i doesn't play any other role apart from determining the running of the outer loop
    br in_loop 

in_loop:
    subi R4, R2, 9  # check if j -(n-1) == 0?
    bz R4, out_loop
    # or else check if stack(j)>stack(j+1)
    # j*4 to find the offset
    srai R5, R2, 1
    srai R5, R5, 1
    add R6, SP, R5  # address = SP + 4*j
    addi R7, R6, 4  # address_1 = SP + 4j + 4 
    ld R8, 0(R6)
    ld R9, 0(R7)
    sub R10, R9, R8 # temp a[j+1]-a[j]
    # # if a[j+1] < a[j] swap
    bmi R10, swap
    addi R2, R2, 1  # j++
    br in_loop

output:
    halt