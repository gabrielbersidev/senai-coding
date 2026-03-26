package pctEx01;

import java.util.Scanner;

public class Exemplo01 {
	
	public static void main (String[] args) {
		double carteira;
		float meta;
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Quanto você tem de dinheiro contigo?");
		carteira = sc.nextDouble();
		
		if (carteira >= 30) {
			System.out.println("Pode ir ao cinema, você tem dinheiro para a entrada");
		} else {
			meta = (float)(30 - carteira);
			System.out.println("Melhor ficar em casa ou encontrar outro tipo de lazer que não ultrapasse o valor de 30 reais.");
			System.out.println("Faltam: R$ " + meta);
		}
		
		sc.close();
	}
}