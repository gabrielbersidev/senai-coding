package pctExc12;

import java.util.Scanner;

public class Exercicio12 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);	

        System.out.println("Digite um número abaixo:");
        
        int num1 = scanner.nextInt();
        boolean isBoolean = false;

        if (num1 % 3 == 0) {
            System.out.println("Seu número é múltiplo por 3.");
            isBoolean = true;
        }
        if (num1 % 5 == 0) {
            System.out.println("Seu número é múltiplo por 5.");
            isBoolean = true;
        }
        if (num1 % 3 == 0 && num1 % 5 == 0) {
            System.out.println("Seu número é divisível por 3 e 5.");
            isBoolean = true;
        }
        if (!isBoolean){
            System.out.println("Seu número não é múltiplo por 3 e 5");
        }
        scanner.close();
    }
}