package pctEx01;

public class Exemplo01 {
	public static void main(String [] args) {
		double num1 = 5;
		double num2 = 2;
		int num3 = 1;
		
		System.out.println("\nOperadores:");
		System.out.println(num1 + " + " + num2 + " = " + (num1 + num2));
		System.out.println(num1 + " - " + num2 + " = " + (num1 - num2));
		System.out.println(num1 + " * " + num2 + " = " + (num1 * num2));
		System.out.println(num1 + " / " + num2 + " = " + (num1 / num2));
		System.out.println(num1 + " % " + num2 + " = " + (num1 % num2));
		System.out.println("\nNúmero antes incremento: "+num3);
		num3++;
		System.out.println("Número após incremento: "+num3);
		num3=1;
		num3--;
		System.out.println("Númer após decremento: "+num3);

	}
}