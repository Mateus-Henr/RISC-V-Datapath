# Colocando valor base na memória
# addi x2, x0, 7
# sw x2, 4(x0)

lw x1, 4(x0)
add x2, x1, x0

add x1, x1, x2
add x1, x1, x2
sub x1, x1, x2
sub x1, x1, x2

# Caso o fluxo venha para cá, seu processador está errado
add x1, x1, x1
sw x1, 0(x0)