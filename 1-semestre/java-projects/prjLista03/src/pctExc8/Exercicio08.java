package pctExc8;

import java.util.Scanner;

public class Exercicio08 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)){
            String password = "1234";
            String user = "admin";

            System.out.println("Bem-Vindo ao Sistema de Login do SENAI SOROCABA!");
            System.out.println("\nDigite seu usuário:");
            String userInput = sc.next();

            System.out.println("\nDigite sua senha:");
            String passwordInput = sc.next();

            if(userInput.equals(user) && passwordInput.equals(password)){
                System.out.println("Login realizado com sucesso! Bem-Vindo.");
            } else {
                System.out.println("Usuário ou Senha incorretos. Tente novamente.");
            }
        }
    }
}