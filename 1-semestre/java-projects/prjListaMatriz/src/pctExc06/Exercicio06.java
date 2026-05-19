package pctExc06;

public class Exercicio06 {

    public static void main(String[] args) {

        double[][] matriz = {
            {1.5, 2.0},
            {3.5, 4.0},
            {5.5, 6.0},
            {7.5, 8.0},
            {9.5, 10.0}
        };

        double soma = 0;
        int quantidadeElementos = 0;

        System.out.println("MATRIZ:");

        for (int i = 0; i < matriz.length; i++) {

            for (int j = 0; j < matriz[i].length; j++) {

                System.out.print(matriz[i][j] + "\t");

                soma += matriz[i][j];
                quantidadeElementos++;
            }

            System.out.println();
        }

        double media = soma / quantidadeElementos;

        System.out.println("\nSoma dos elementos = " + soma);
        System.out.println("Quantidade de elementos = " + quantidadeElementos);
        System.out.println("Média dos elementos = " + media);
    }
}