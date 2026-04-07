package pctExc03;

import java.util.Scanner;

enum MenuOption {
	A, B, C, D
}

public class Exercicio03 {
	public static void main (String [] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.print("Digite uma opção (A, B, C, D): ");
		String input = scanner.nextLine().toUpperCase();

		try {
			MenuOption option = MenuOption.valueOf(input);

			switch (option) {
				case A -> System.out.println("Cadastrar");
				case B -> System.out.println("Listar");
				case C -> System.out.println("Excluir");
				case D -> System.out.println("Sair");
			}
		} catch (IllegalArgumentException e) {
			System.out.println("Opção inválida");
		}
		
		scanner.close();
	}
}