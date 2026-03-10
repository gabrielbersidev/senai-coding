package pctExc8;

public class Exercicio08 {
    public static void main(String [] args) {
        fahrenheitToCelsius(14);
    }

    public static void fahrenheitToCelsius(double fahrenheit) {
        double celsius = (fahrenheit - 32) * 5/9;
        System.out.println("A conversão de " + fahrenheit + " Fahrenheit para Celsius é: " + celsius);
    }
}
