import java.util.Scanner;

public class Exercicio1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("MENU:");
        System.out.println("A - Café (R$ 4)");
        System.out.println("B - Suco (R$ 6)");
        System.out.println("C - Sanduíche (R$ 10)");

        System.out.print("Escolha uma opção: ");
        char opcao = sc.next().charAt(0);

        // Evita erro de minúsculo
        opcao = Character.toUpperCase(opcao);

        System.out.print("Quantidade: ");
        int quantidade = sc.nextInt();

        int preco = 0;

        switch (opcao) {
            case 'A':
                preco = 4;
                break;
            case 'B':
                preco = 6;
                break;
            case 'C':
                preco = 10;
                break;
            default:
                System.out.println("Opção inválida!");
                return;
        }

        int total = preco * quantidade;

        System.out.println("Total: R$ " + total);
    }
}