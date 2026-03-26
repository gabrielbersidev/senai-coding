package pctEx04;

import java.util.Scanner;

public class Exemplo04 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int idade = lerInt(sc, "Idade: ");

        if (idade < 12 || idade > 60) {
            System.out.println("Tem direito à meia-entrada.");
        } else {
            System.out.println("Não tem direito à meia-entrada.");
        }

        sc.close();
    }

    public static int lerInt(Scanner sc, String mensagem) {
        System.out.print(mensagem);
        return sc.nextInt();
    }
}