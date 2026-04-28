import java.util.Scanner;

public class Exercicio2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("MENU:");
        System.out.println("1 - Hambúrguer (R$ 15)");
        System.out.println("2 - Pizza (R$ 20)");
        System.out.println("3 - Refrigerante (R$ 5)");

        System.out.print("Escolha uma opção: ");
        int opcao = sc.nextInt();

        System.out.print("Quantidade: ");
        int quantidade = sc.nextInt();

        int preco = 0;

        switch (opcao) {
            case 1:
                preco = 15;
                break;
            case 2:
                preco = 20;
                break;
            case 3:
                preco = 5;
                break;
            default:
                System.out.println("Opção inválida!");
                return;
        }

        double total = preco * quantidade;

        // Aplica desconto
        if (quantidade > 3) {
            total = total * 0.9; // 10% de desconto
        }

        System.out.println("Total a pagar: R$ " + total);
    }
}