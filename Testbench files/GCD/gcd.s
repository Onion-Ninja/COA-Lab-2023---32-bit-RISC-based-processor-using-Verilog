# program to calculate the gcd of two numbers using euclid's algorithm
.text
addi R1,R0,10 # load the first immediate number a
addi R2,R0,25 # load the second immediate number b

# Compare the two numbers 
sub R3,R1,R2 
bmi R3, swap # If a < b swap a and b
br loop

# swap a and b
swap:
    move R3, R2
    move R2, R1
    move R1, R3
    br loop

# set a<=b, and b<=a-b
loop: 
    sub R4, R1, R2 # temp=a-b
    move R1, R2 # a=b
    move R2, R4 # b=temp= a-b
    bz R2, output # check if b==0, if yes then output gcd = a
    # or if b!=0 then check which is greater a or b, if a>b no swap else swap
    sub R5, R1, R2 # temp2= a-b
    bmi R5, swap   # swap if temp2 less than 0 or a<b
    br loop     # else branch to loop again

# when we have reached the final step b becomes 0 and a is the gcd value
output:
    halt    # halt the program
    
