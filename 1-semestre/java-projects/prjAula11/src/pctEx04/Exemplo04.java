package pctEx04;

import java.util.Scanner;

public class Exemplo04 {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        int linhas = 3;
        int colunas = 3;

        int[][] matriz = new int[linhas][colunas];

        int i, j;

        System.out.println("Inserção na matriz");

        // preenchendo a matriz
        for (i = 0; i < linhas; i++) {

            for (j = 0; j < colunas; j++) {

                System.out.print("Digite um valor para matriz[" + i + "][" + j + "]: ");

                matriz[i][j] = sc.nextInt();
            }
        }

        // exibindo a matriz
        System.out.println("\nMatriz preenchida:\n");

        for (i = 0; i < linhas; i++) {

            for (j = 0; j < colunas; j++) {

                System.out.print(matriz[i][j] + "\t");
            }

            System.out.println();
        }

        sc.close();
    }
}