package pctExc01;

import java.util.Scanner;

public class Exercicio01 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String option;
        int amount;
        double price = 0;

        System.out.println("MENU Lanchonete");
        System.out.println("A - Café (R$4)");
        System.out.println("B - Suco (R$6)");
        System.out.println("C - Sanduíche (R$10)");
        
        System.out.print("Escolha uma opção: ");
        option = scanner.next();

        System.out.print("Digite a quantidade: ");
        amount = scanner.nextInt();

        switch (option.toUpperCase()) {
            case "A":
                price = 4 * amount;
                break;
            case "B":
                price = 6 * amount;
                break;
            case "C":
                price = 10 * amount;
                break;
            default:
                System.out.println("Opção inválida");
                scanner.close();
                return;
        }

        System.out.println("Total: R$ " + price);

        scanner.close();
    }
}