`timescale 1ns/100 ps

module simulacao_desloc;



logic [1:0] shift;
logic [63:0] entrada;
logic [5:0] n;
logic [63:0] saida;

Deslocamento RD(	.Shift(shift),
					.Entrada(entrada),
					.N(n),
					.Saida(saida));
					

initial 

begin

$monitor($time,"Entrada = %b, shift = %b, N = %d, saida = %b", entrada,shift,n,saida);
shift = 2'b00;
entrada = 64'd4;//testar shift a esquerda
n = 6'd2;
#10

shift = 2'b01;
entrada = 64'b1111111111111111111111111111111111111111111111111111111111111100;//testar shift lógico a direita
n = 6'd1;
#20

shift = 2'b10;
n = 6'd8;
entrada = 64'b1111111111111111111111111111111111111111111111111111111100000000;//testar shift aritmético a direita
#10

$stop;
end


endmodule:simulacao_desloc