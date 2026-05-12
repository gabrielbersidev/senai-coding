package pctEx01;

public class Exemplo01 {
    public static void main (String [] args){

        int[][] matriz = new int[30][10];
        
        for (int i = 0; i < 30; i++) {
            for (int j = 0; j < 10; j++) {
                matriz[i][j] = i * 10 + j;
            }
        }

    }
}


