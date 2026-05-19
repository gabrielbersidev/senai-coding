package pctExc08;

public class Exercicio08 {

    public static void main(String[] args) {

        int[][] matriz = {
            {1, 2, 3},
            {4, 5, 6},
            {7, 8, 9}
        };

        int[][] matrizInvertida = new int[3][3];

        System.out.println("MATRIZ ORIGINAL:");

        for (int i = 0; i < matriz.length; i++) {

            for (int j = 0; j < matriz[i].length; j++) {

                System.out.print(matriz[i][j] + "\t");
            }

            System.out.println();
        }

        for (int i = 0; i < matriz.length; i++) {

            for (int j = 0; j < matriz[i].length; j++) {

                matrizInvertida[j][i] = matriz[i][j];
            }
        }

        System.out.println("\nMATRIZ INVERTIDA:");

        for (int i = 0; i < matrizInvertida.length; i++) {

            for (int j = 0; j < matrizInvertida[i].length; j++) {

                System.out.print(matrizInvertida[i][j] + "\t");
            }

            System.out.println();
        }
    }
}