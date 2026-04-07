package pctExc5;


import java.util.Scanner;

public class Exercicio05 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
            System.out.println("Escolha um número de 1 a 7 para saber se é dia útil ou não:");
            String dia;
            int num = sc.nextInt();
            switch (num) {
                case 1: 
                dia = "Domingo, Fim de Semana";
                System.out.println(dia); 
                break;

                case 2: 
                dia = "Segunda, Dia útil"; 
                break;
                
                case 3: 
                dia = "Terça, Dia Útil"; 
                break;
                
                case 4: 
                dia = "Quarta, Dia Útil"; 
                break;

                case 5: 
                dia = "Quinta, Dia Útil"; 
                break;
                
                case 6: 
                dia = "Sexta, Dia Útil"; 
                break;

                case 7: 
                dia = "Sábado, Fim de Semana"; 
                break;

                default: System.out.println("Opção inválida!"); 
                return;
            }
        }
    }
}