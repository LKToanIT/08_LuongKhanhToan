package org.example.Testing_System_Assignment_3;

import java.util.Random;
import java.util.Scanner;

public class Exercise_1 {
    public static void main(String[] args) {
        //roundingSalary();
        //randomNumber();
        last2Digits(randomNumber());
        //quotients();

    }
    //question 1
    public static void roundingSalary() {
        System.out.println("question 1");
        float salary1 = 5240.5f;
        float salary2 = 10970.055f;
        int intSalary1 = (int) salary1;
        int intSalary2 = (int) salary2;
        System.out.println("(int) salary: ");
        System.out.println("int salary 1: " + intSalary1);
        System.out.println("int salary 2: " + intSalary2);
        System.out.println("rounding: ");
        System.out.printf("salary 1: %.0f%n", salary1);
        System.out.printf("salary 2: %.0f%n", salary2);
    }

    //question 2
    public static int randomNumber() {
        int min = 0, max = 99999;
        int a = (int) (Math.random() * max) + min;
        System.out.printf("Random Number: %05d%n", a);
        return a;
    }

    //question 3: last2Digits - 2 chữ số cuối
    public static void last2Digits(int a) {
        int twoDigits = a % 100;
        System.out.printf("Hai chữ số cuối của số ngẫu nhiên là: %02d%n", twoDigits);
    }

    //question 4
    public static void quotients() {
        int a, b;
        Scanner s = new Scanner(System.in);
        System.out.print("Nhập a: ");
        a = s.nextInt();
        do {
            System.out.print("Nhập b: ");
            b = s.nextInt();
            if (b == 0) {
                System.out.println("Nhập b khác 0!");
            }
        } while (b == 0);
        s.close();
        float quotient = (float) a/b;
        System.out.printf("Kết quả phép chia = %.3f%n", quotient);
    }
}
