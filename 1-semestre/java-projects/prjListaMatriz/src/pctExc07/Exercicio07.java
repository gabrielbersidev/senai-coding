package pctExc07;

public class Exercicio07 {

    public static void main(String[] args) {

        int[][] matriz = {
            {10, 25, 30},
            {5, 18, 42},
            {7, 90, 12},
            {65, 2, 8},
            {14, 33, 27},
            {50, 1, 99}
        };

        System.out.println("MATRIZ:");

        for (int i = 0; i < matriz.length; i++) {

            for (int j = 0; j < matriz[i].length; j++) {

                System.out.print(matriz[i][j] + "\t");
            }

            System.out.println();
        }

        int maior = matriz[0][0];
        int menor = matriz[0][0];

        for (int i = 0; i < matriz.length; i++) {

            for (int j = 0; j < matriz[i].length; j++) {

                if (matriz[i][j] > maior) {

                    maior = matriz[i][j];
                }

                if (matriz[i][j] < menor) {

                    menor = matriz[i][j];
                }
            }
        }

        System.out.println("\nMaior elemento = " + maior);
        System.out.println("Menor elemento = " + menor);
    }
}