package pctExc10;
import java.util.Scanner;

public class Exercicio10 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);	
        System.out.println("Bem-vindo ao cálculo de IMC!");

        System.out.println("Digite a altura do indivíduo (Exemplo: 1,80m):");
        double height = sc.nextDouble();
        System.out.println("Digite o peso do indivíduo (Exemplo: 60,5kg):");
        double weight = sc.nextDouble();

        sc.close();

        double imc = weight / (height * height);
        System.out.println("O IMC é: " + imc);

        if (imc<18){
            System.out.println("Indivíduo Abaixo do Peso.");
        } else if (imc>= 18 && imc<=25 ){
            System.out.println("Indíviduo com IMC Normal.");
        } else if (imc>= 25){
            System.out.println("Acima do peso.");
        }
    }
}