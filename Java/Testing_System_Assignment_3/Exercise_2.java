package org.example.Testing_System_Assignment_3;


import java.time.LocalDate;
import java.util.Scanner;

public class Exercise_2 {
    public static void main(String[] args) {
        question1();
    }
    public static void question1() {
        int a = 10, b = 8;
        System.out.println("Nhập 5 phần tử cho mảng: ");
        Account[] accounts = new Account[5];
        Account acc = new Account();
        for (int i=0; i<accounts.length; i++) {
            acc.email = "Email " + i;
            acc.userName = "User Name " + i;
            acc.fullName = "Full Name " + i;
            acc.createDate = LocalDate.now();
            accounts[i] = acc;
            System.out.println("Thông tin account " + (i+1) + ":\n" + "Email: " + acc.email + ", User Name: " + acc.userName + ", Full Name: " + acc.fullName + ", Create Date: " + acc.createDate);
        }
    }
}
