package pctExc7;

import java.util.Scanner;

public class Exercicio07 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)){

        System.out.print("Digite o valor da compra: ");
        double valor = sc.nextDouble();

        double valorFinal = (valor > 100) ? valor * 0.9 : valor;
        System.out.println("Valor final: " + valorFinal);
        }
    }
}