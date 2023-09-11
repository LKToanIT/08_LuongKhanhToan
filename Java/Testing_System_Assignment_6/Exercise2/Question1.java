package Exercise2;

import java.util.Scanner;

public class Question1 {
    public static void main(String[] args) {
        int a, b;
        Scanner s = new Scanner(System.in);
        System.out.print("Nhap so a: ");
        a = s.nextInt();
        System.out.print("Nhap so b: ");
        b = s.nextInt();
        try {
            System.out.println("Ket qua phep chia 2 so a va b = " + divide(a,b));
        }
        catch (Exception e) {
            System.out.println("Cannot divide 0");
        }
    }
    public static float divide(int a, int b) {
        return a/b;
    }
}
