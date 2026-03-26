package pctEx03;

import java.util.Scanner;

public class Exemplo03 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int idade = lerInt(sc, "Idade: ");
        double altura = lerDouble(sc, "Altura (m), com virgula: ");

        if (podeEntrar(idade, altura)) {
            System.out.println("Pode entrar.");
        } else {
            System.out.println("Não pode entrar.");
        }

        sc.close();
    }

    public static boolean podeEntrar(int idade, double altura) {
        return idade >= 12 && altura >= 1.40;
    }

    public static int lerInt(Scanner sc, String mensagem) {
        System.out.print(mensagem);
        return sc.nextInt();
    }

    public static double lerDouble(Scanner sc, String mensagem) {
        System.out.print(mensagem);
        return sc.nextDouble();
    }
}