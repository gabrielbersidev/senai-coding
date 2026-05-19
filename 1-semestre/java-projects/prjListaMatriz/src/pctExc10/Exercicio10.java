package pctExc10;

public class Exercicio10 {

    public static void main(String[] args) {

        int[][] matriz = {
            {1, 2, 5, 1, 4},
            {3, 2, 4, 2, 3},
            {4, 1, 2, 3, 7},
            {5, 5, 2, 4, 9},
            {1, 2, 4, 5, 1}
        };

        int somaDiagonal = 0;

        System.out.println("MATRIZ:");

        for (int i = 0; i < matriz.length; i++) {

            for (int j = 0; j < matriz[i].length; j++) {

                System.out.print(matriz[i][j] + "\t");
            }

            System.out.println();
        }

        for (int i = 0; i < matriz.length; i++) {

            somaDiagonal += matriz[i][i];
        }

        System.out.println("\nSoma da diagonal principal = " + somaDiagonal);
    }
}