package pctExc13;

import java.util.Scanner;

public class Exercicio13 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);	

        System.out.println("Digite os lados de um triângulo abaixo (a, b, c).");

        System.out.println("\nDigite o lado A:");
        double ladoA = scanner.nextDouble();
        System.out.println("\nDigite o lado B:");
        double ladoB = scanner.nextDouble();
        System.out.println("\nDigite o lado C:");
        double ladoC = scanner.nextDouble();

        if (ladoA == ladoB && ladoA == ladoC) {
            System.out.println("Seu triângulo é Equilátero.");
        } 
        else if (ladoA == ladoB || ladoA == ladoC || ladoB == ladoC) {
            System.out.println("Seu triângulo é Isósceles.");
        } 
        else {
            System.out.println("Seu triângulo é Escaleno.");
        }

        scanner.close();
    }
}