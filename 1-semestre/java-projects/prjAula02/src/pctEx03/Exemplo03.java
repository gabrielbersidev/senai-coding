package pctEx03;

import java.util.Scanner;


public class Exemplo03 {
    public static void main(String[] args){
    	
    	int multiplicador = 0;
    	
        try(Scanner userInput = new Scanner(System.in)){
            System.out.print("Digite o número que você deseja visualizar a tabuada: ");
            int multiplicando = userInput.nextInt();
            for (int i = 1; i < 101; i++) {
                System.out.println(multiplicando*(multiplicador+i));
            }

        }
        		
    }
}
