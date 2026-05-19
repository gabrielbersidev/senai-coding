package pctExc04;

public class Exercicio04 {

    public static void main(String[] args) {

        // Matriz 5x5
        int[][] matriz = {
            {1, 2, 3, 4, 5},
            {6, 7, 8, 9, 10},
            {11, 12, 13, 14, 15},
            {16, 17, 18, 19, 20},
            {21, 22, 23, 24, 25}
        };

        int somaImpares = 0;

        System.out.println("MATRIZ:");

        // Exibe a matriz
        for (int i = 0; i < matriz.length; i++) {

            for (int j = 0; j < matriz[i].length; j++) {

                System.out.print(matriz[i][j] + "\t");

                // Soma dos números ímpares
                if (matriz[i][j] % 2 != 0) {

                    somaImpares += matriz[i][j];
                }
            }

            System.out.println();
        }

        // a) Soma dos números ímpares
        System.out.println("\nSoma dos números ímpares = " + somaImpares);

        // b) Soma de cada coluna
        System.out.println("\nSoma de cada coluna:");

        for (int j = 0; j < matriz[0].length; j++) {

            int somaColuna = 0;

            for (int i = 0; i < matriz.length; i++) {

                somaColuna += matriz[i][j];
            }

            System.out.println("Coluna " + (j + 1) + " = " + somaColuna);
        }

        // c) Soma de cada linha
        System.out.println("\nSoma de cada linha:");

        for (int i = 0; i < matriz.length; i++) {

            int somaLinha = 0;

            for (int j = 0; j < matriz[i].length; j++) {

                somaLinha += matriz[i][j];
            }

            System.out.println("Linha " + (i + 1) + " = " + somaLinha);
        }
    }
}