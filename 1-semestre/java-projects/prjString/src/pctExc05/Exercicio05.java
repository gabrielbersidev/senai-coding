package pctExc05;

import java.util.Scanner;

public class Exercicio05 {
    public static void main(String [] args){
       Scanner sc = new Scanner(System.in);
       int Consoantes = 0;

       System.out.println("Digite uma palavra qualquer para descobrir suas consoantes");
       String userString = sc.nextLine();
       String upperString = userString.toUpperCase();
       sc.close(); 
       int numeroCaracteres = userString.length();
       
       for (int i = 0; i < numeroCaracteres; i++){
            char charUserString = upperString.charAt(i);
            if (charUserString != 'A' || charUserString != 'E' || charUserString != 'I' || charUserString != 'O' || charUserString != 'U'){
                Consoantes++;
            }
        }
        System.out.println("Seu núero de consoantes é: " + Consoantes);
    }
}
