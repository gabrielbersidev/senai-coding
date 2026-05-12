package pctEx03;

public class Exemplo03 {

	public static void main(String[] args) {
		
		String [][] Clientes = new String [3][3];
		Clientes [0][0] = "João Roberto";
		Clientes [0][1] = "Rua das Flores";
		Clientes [0][2] = "Cerejeiras";
		Clientes [1][0] = "Maria Silva";
		Clientes [1][1] = "Avenida dos Anjos, n 01";
		Clientes [1][2] = "Cidade Alta";
		Clientes [2][0] = "Pedro Amaro";
		Clientes [2][1] = "Rua da Liberdade";
		Clientes [2][2] = "Praça 67";
		
		// imprimir os clientes
		for (int lin = 0; lin < 3; lin++) {
			for (int col = 0; col < 3; col++) {
				System.out.print(Clientes[lin][col] + " | ");
			}
			System.out.println();
		}
	}

}
