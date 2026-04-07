package pctExc6;
import java.util.Scanner;

public class Exercicio06 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
            System.out.println("Insira números para que, ao final, se realize uma operação de sua escolha com os números inseridos.");
            System.out.println("\nInsira seu primeiro número:");
            double num1 = sc.nextDouble();
            System.out.println("Insira seu segundo número:");
            double num2 = sc.nextDouble();

            System.out.println("\nEscolha uma operação e em seguida os números o qual você quer calcular:");
            System.out.println("(+)");
            System.out.println("(-)");
            System.out.println("(*)");
            System.out.println("(/)");
            String caseControl = sc.next();
            switch (caseControl) {
                case "+": 
                System.out.println("\nAqui está sua soma:");
                System.out.println(num1+num2);
                break;

                case "-": 
                System.out.println("\nAqui está sua subtração:");
                System.out.println(num1-num2);
                break;
                
                case "*": 
                System.out.println("\nAqui está sua multiplicação:");
                System.out.println(num1*num2);
                break;
                
                case "/": 
                System.out.println("\nAqui está sua divisão:");
                System.out.println(num1/num2);
                break;

                default: System.out.println("\nOpção inválida! Digite apenas +, -, / ou *"); 
                return;
            }
        }
    }
}