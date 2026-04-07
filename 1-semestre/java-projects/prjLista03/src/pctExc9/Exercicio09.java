package pctExc9;

import java.util.Scanner;

public class Exercicio09 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {

            System.out.print("Digite um valor entre 10 e 50: ");
            int valor = sc.nextInt();

            String resultado = (valor >= 10 && valor <= 50) 
                ? "Dentro do intervalo" 
                : "Fora do intervalo";

            System.out.println(resultado);
        }
    }
}