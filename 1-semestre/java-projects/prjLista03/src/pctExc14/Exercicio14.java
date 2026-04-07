package pctExc14;
import java.util.Scanner;

public class Exercicio14 {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)){

            double valorTotal;
            double valorImposto;
            double valorTotalcomImposto;
            

            System.out.println("Digite abaixo o valor unitário do produto (em reais)");
            double valorUnitario = sc.nextDouble();

            System.out.println("Digite abaixo o valor unitário do produto (em reais)");
            double unidadesCompradas = sc.nextDouble();

            valorTotal = valorUnitario*unidadesCompradas;
            valorImposto = (valorTotal/100)*15;
            valorTotalcomImposto = valorTotal+valorImposto;

            System.out.println("Valor total da compra: " + valorTotal);
            System.out.println("Valor total do imposto: " + valorImposto);
            System.out.println("Valor total da compra junto de impostos+ " + valorTotalcomImposto);
        }
    }
}
