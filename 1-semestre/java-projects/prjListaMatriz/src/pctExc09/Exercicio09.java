package pctExc09;

public class Exercicio09 {

    public static void main(String[] args) {

        int[][] matriz1 = {
            {1, 2},
            {3, 2},
            {4, 1},
            {5, 5},
            {1, 2}
        };

        int[][] matriz2 = {
            {2, 4},
            {5, 3},
            {7, 7},
            {4, 4},
            {1, 9}
        };

        int[][] matriz3 = new int[5][2];

        System.out.println("MATRIZ 1:");

        for (int i = 0; i < matriz1.length; i++) {

            for (int j = 0; j < matriz1[i].length; j++) {

                System.out.print(matriz1[i][j] + "\t");
            }

            System.out.println();
        }

        System.out.println("\nMATRIZ 2:");

        for (int i = 0; i < matriz2.length; i++) {

            for (int j = 0; j < matriz2[i].length; j++) {

                System.out.print(matriz2[i][j] + "\t");
            }

            System.out.println();
        }

        for (int i = 0; i < matriz1.length; i++) {

            for (int j = 0; j < matriz1[i].length; j++) {

                matriz3[i][j] = matriz1[i][j] + matriz2[i][j];
            }
        }

        System.out.println("\nMATRIZ 3 (SOMA):");

        for (int i = 0; i < matriz3.length; i++) {

            for (int j = 0; j < matriz3[i].length; j++) {

                System.out.print(matriz3[i][j] + "\t");
            }

            System.out.println();
        }
    }
}