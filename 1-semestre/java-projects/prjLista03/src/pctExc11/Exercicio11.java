package pctExc11;


import java.util.Scanner;

public class Exercicio11 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
            System.out.println("Escolha sua opção no app do Banco:");
            int num = sc.nextInt();
            switch (num) {
                case 1: 
                System.out.println("Seu saldo é de R$900,00."); 
                break;

                case 2:
                System.out.println("Seu saldo é de R$900,00."); 
                break;
                
                case 3:
                System.out.println("Você saiu.");
                break;

                default: System.out.println("Opção inválida!"); 
                return;
            }
        }
    }
}