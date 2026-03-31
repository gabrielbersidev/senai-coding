package pctExc02;

import java.util.Scanner;

public class Exercicio02 {
    public static void main(String[] args) {
    	Scanner scanner = new Scanner(System.in);	
    	
    	System.out.println("Abaixo, você pode ver algumas opções do cardápio disponível para sua escolha:");
    	System.out.println("1 - Margina com Pão");
    	System.out.println("2 - Pão de Batata com Calabresa");
    	System.out.println("3 - Rosquinha Doce");
    	System.out.println("4 - Pão de Queijo");
    	System.out.println("Escolha uma opção com seu teclado (1, 2, 3, 4):");
    	
    	int option = scanner.nextInt();
    	
    	switch(option) {
    	
    	case 1:
    		System.out.println("Você escolheu Margina com Pão");
    		break;
    	case 2:
    		System.out.println("Você escolheu Pão de Batata com Calabresa");
    		break;
    	case 3:
    		System.out.println("Você escolheu Rosquinha");
    		break;
    	case 4:
    		System.out.println("Você escolheu Pão de Queijo");
    		break;
    	default:
    		System.out.println("Opção Inválida");
    		break;
    	}

    	scanner.close();
    }
}