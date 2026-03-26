package pctEx02;

import java.util.Scanner;

public class Exemplo02 {

	public static void main (String[] args) {
		int num;
		
		Scanner sc = new Scanner(System.in);	
		System.out.println("Informe um número de 1 a 7:");
		num = sc.nextInt();
		
		String[] dias = {
				"Domingo", "Segunda-feira", "Terça-feira",
				"Quarta-feira", "Quinta-feira", "Sexta-feira", "Sábado"
			};

			if (num >= 1 && num <= 7) {
				System.out.println(dias[num - 1]);
			} else {
				System.out.println("Número inválido!");
			}
		
		sc.close();
	}
}