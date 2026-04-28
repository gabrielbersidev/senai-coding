package pctExc04;

import java.util.Scanner;

public class Exercicio04 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Digite uma palavra qualquer para ser invertida: ");
        String userString = sc.nextLine();
        
        String invertida = new StringBuilder(userString).reverse().toString();

        System.out.println(invertida);
        sc.close();
    }
}