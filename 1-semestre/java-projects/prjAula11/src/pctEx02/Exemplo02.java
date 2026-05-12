package pctEx02;

public class Exemplo02 {
    public static void main (String [] args){

        int[][] matriz = {{100,200,300},{150,250,350}};
        
        // imprimir a matriz
        for (int lin = 0; lin < matriz.length; lin++) {
            for (int col = 0; col < matriz[lin].length; col++) {
                System.out.print(matriz[lin][col] + " ");
            }
            System.out.println();
        }

    }
}


