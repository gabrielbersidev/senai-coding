package pctExc04;

import java.util.Scanner;

public class Exercicio04 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);	

        int option;
        int amount;
        double price = 0;

        System.out.println("MENU Lanchonete");
        System.out.println("1 - Hamburguer (R$15)");
        System.out.println("2 - Pizza (R$20)");
        System.out.println("3 - Refrigerante (R$5)");
        System.out.println("ESCOLHA UMA OPÇÃO ACIMA");

        option = scanner.nextInt();

        System.out.println("Agora, digite a quantidade:");
        amount = scanner.nextInt();

        switch(option) {
            case 1:
                price = 15 * amount;
                break;
            case 2:
                price = 20 * amount;
                break;
            case 3:
                price = 5 * amount;
                break;
            default:
                System.out.println("Opção Inválida");
                scanner.close();
                return;
        }

        System.out.println("Total: R$" + price +"0");

        scanner.close();
    }
}