package pctExc02;

public class Exercicio02 {
    public static void main(String[] args) {

        String[][] matrizA = {
            {"a", "b", "c", "d", "e"},
            {"f", "g", "h", "i", "j"},
            {"l", "m", "n", "o", "p"},
            {"q", "r", "s", "t", "u"}
        };

        int[][] matrizB = {
            {19, 25, 100, 99},
            {10, 7, 25, 14},
            {35, 2, 47, 74}
        };

        double[][] matrizC = {
            {1.9, 2.5, 10.0},
            {1.0, 7.8, 2.5},
            {3.5, 2.2, 4.7}
        };

     
        System.out.println("MATRIZ A:");

        for (int i = 0; i < matrizA.length; i++) {

            for (int j = 0; j < matrizA[i].length; j++) {

                System.out.print(matrizA[i][j] + " ");
            }

            System.out.println();
        }

        
        System.out.println("MATRIZ B:");

        for (int i = 0; i < matrizB.length; i++) {

            for (int j = 0; j < matrizB[i].length; j++) {

                System.out.print(matrizB[i][j] + " ");
            }

            System.out.println();
        }

        
        System.out.println("MATRIZ C:");

        for (int i = 0; i < matrizC.length; i++) {

            for (int j = 0; j < matrizC[i].length; j++) {

                System.out.print(matrizC[i][j] + " ");
            }

            System.out.println();
        }
    }
}