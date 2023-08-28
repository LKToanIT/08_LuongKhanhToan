package org.example.Testing_System_Assignment_2;

import java.util.Locale;

public class Exercise_6 {
    public static void main(String[] args) {
        showEvenNumberLessThan10(10);
        showInforAccounts();
        showAllNumberLessThan10(10);
    }
    //in ra số chẵn nguyên dương nhỏ hơn 10
    //có từ khóa static trước tên hàm thì không cần khởi tạo đối tượng
    //để gọi hàm từ trong main
    public static void showEvenNumberLessThan10 (int maxNumber) {
        for (int i = 0; i < maxNumber; i++) {
            if (i % 2 == 0) {
                System.out.print(i + " ");
            }
        }
        System.out.println("\n");
    }

    //tạo method in ra thông tin các account
    public static void showInforAccounts () {

    }

    //tạo method in ra các số nguyên dương nhỏ hơn
    public static void showAllNumberLessThan10 (int maxNumber) {
        for (int i = 0; i < maxNumber; i++) {
                System.out.print(i + " ");
        }
    }
}
