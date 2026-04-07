package pctEx05;

import java.util.Scanner;

public class Exemplo05 {
    public static void main(String[] args) {
        
        try (Scanner sc = new Scanner (System.in)){
            String correctPassword = "12345";
            String userInputPassword;
            do {
                System.out.println("Digite a senha");
                userInputPassword = sc.nextLine();
            } while (!userInputPassword.equals(correctPassword));
            System.out.println("Acesso liberado");
        }
        
    }
}
