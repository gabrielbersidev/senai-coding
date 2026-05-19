package pctExc05;

import java.util.Scanner;

public class Exercicio05 {

    public static void main(String[] args) {

        Scanner entrada = new Scanner(System.in);

        int[][] matriz = {
            {10, 20, 30},
            {40, 50, 60},
            {70, 80, 90},
            {100, 110, 120}
        };

        System.out.println("MATRIZ:");

        for (int i = 0; i < matriz.length; i++) {

            for (int j = 0; j < matriz[i].length; j++) {

                System.out.print(matriz[i][j] + "\t");
            }

            System.out.println();
        }

        System.out.print("\nDigite um valor para procurar na matriz: ");
        int valor = entrada.nextInt();

        boolean encontrado = false;

        for (int i = 0; i < matriz.length; i++) {

            for (int j = 0; j < matriz[i].length; j++) {

                if (matriz[i][j] == valor) {

                    encontrado = true;
                }
            }
        }

        if (encontrado) {

            System.out.println("O valor se encontra na matriz");

        } else {

            System.out.println("O valor NÃO se encontra na matriz");
        }

        entrada.close();
    }
}