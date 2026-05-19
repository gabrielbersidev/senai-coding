package pctExc03;

public class Exercicio03 {

    public static void main(String[] args) {

        int[][] matriz = {
            {1, 2, 2},
            {3, 2, 3},
            {4, 1, 1}
        };

        System.out.println("MATRIZ:");

        for (int i = 0; i < matriz.length; i++) {

            for (int j = 0; j < matriz[i].length; j++) {

                System.out.print(matriz[i][j] + " ");
            }

            System.out.println();
        }

        System.out.println();

        for (int i = 0; i < matriz.length; i++) {

            int soma = 0;

            for (int j = 0; j < matriz[i].length; j++) {

                soma += matriz[i][j];
            }

            System.out.println("Soma Linha " + (i + 1) + " = " + soma);
        }
    }
}