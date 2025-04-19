MIPS Monociclo em Verilog

1. O Projeto

Este projeto implementa um processador MIPS monociclo em Verilog, desenvolvido para a disciplina de Sistemas Digitais (UFPE). O processador executa um conjunto de instruções MIPS, incluindo addi, add, sw, e lw, em um único ciclo de clock. O programa de teste configura registradores ($s0=10, $s1=20, $t0=30, $t1=30) e realiza operações de memória (mem[10]=30).

Equipe: Ana Clara dos Santos, Guilherme Barbosa, Igor Raphael, Rodrigo Neves, Thiago Bernardo.

2. Estrutura do Projeto

O MIPS monociclo é composto por módulos Verilog, cada um implementando uma parte do processador:





PC e PC+4: Gerencia o Program Counter (PC) e incremento (PC+4).



Memória de Instruções (Rodrigo): Armazena instruções MIPS.



Banco de Registradores (Thiago): 32 registradores de 32 bits.



Memória de Dados (Guilherme): Suporta operações lw e sw.



Unidade de Controle (Igor): Gera sinais de controle (RegDst, ALUSrc, etc.).



ALU (Ana): Executa operações aritméticas e lógicas.



SignExtend e Mux: Suportam extensão de sinal e seleção de dados.

O módulo principal, MIPS_Monocycle, integra todos os componentes.

3. Ferramentas





Simulador Verilog: EDA Playground (Icarus Verilog, com VCD para formas de onda).



Simulador Assembly: MARS para testar o código MIPS.



Comunicação: Discord e Google Meet.



Documentação: Canva.

4. Estrutura do Repositório





mips_monocycle.v: Código Verilog completo do MIPS monociclo.



tb_mips_monocycle.v: Testbench para simulação.



mips1.asm: Código assembly para MARS.



instruction_mem.v: Memória de instruções.



pc_pc+4.v: Módulos PC e PC+4.

5. Resultados





MARS: Saída 10, 20, 30, 30, com registradores e memória corretos.



EDA Playground: $monitor confirma execução, com PC, registradores, ALU, e memória atualizados corretamente.
