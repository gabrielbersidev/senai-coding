package pctExc01;

import java.util.Scanner;

public class Exercicio01 {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        String[][] clientes = new String[3][4];

        for (int i = 0; i < clientes.length; i++) {

            System.out.println("Cadastro do cliente " + (i + 1));

            System.out.print("Nome: ");
            clientes[i][0] = sc.nextLine();

            System.out.print("Endereço: ");
            clientes[i][1] = sc.nextLine();

            System.out.print("Telefone: ");
            clientes[i][2] = sc.nextLine();

            System.out.print("CPF: ");
            clientes[i][3] = sc.nextLine();
        }

        System.out.println("O que foi cadastrado:");

        for (int i = 0; i < clientes.length; i++) {

            System.out.println("Nome: " + clientes[i][0]);
            System.out.println("Endereço: " + clientes[i][1]);
            System.out.println("Telefone: " + clientes[i][2]);
            System.out.println("CPF: " + clientes[i][3]);

            System.out.println();
        }

        sc.close();
    }
}