package pctExc11;

import java.util.Scanner;

public class Exercicio11 {
	public static void main(String[] args) {
		Scanner entrada = new Scanner(System.in);
		
		System.out.print("Digite a largura do retângulo: ");
		double largura = entrada.nextDouble();
		
		System.out.print("Digite a altura do retângulo: ");
		double altura = entrada.nextDouble();
		
		double area = largura * altura;
		
		System.out.println("\nÁrea do retângulo: " + area);
		
		entrada.close();
	}
}
