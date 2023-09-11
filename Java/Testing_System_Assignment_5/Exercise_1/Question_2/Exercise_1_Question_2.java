package org.example.Exercise_1.Question_2;

import java.awt.desktop.SystemEventListener;
import java.util.Scanner;

public class Exercise_1_Question_2 {
    private Tuyen_sinh tuyenSinh;
    private Scanner scanner;
    public Exercise_1_Question_2() {
        scanner = new Scanner(System.in);
        tuyenSinh = new Tuyen_sinh();
    }

    public void question2() {
        while (true) {//la mot vong lap vo han nen can co lenh thoat vong lap
            System.out.println("=========================");
            System.out.println("LỰA CHỌN CHỨC NĂNG THEO SỐ");
            System.out.println("1 - Nhập thông tin thí sinh");
            System.out.println("2 - Hiển thị thông tin thí sinh");
            System.out.println("3 - Tìm thông tin thí sinh theo số ID");
            System.out.println("4 - Thoát");
            System.out.println("=========================");

            System.out.print("Nhập số lựa chọn: ");
            int choose = scanner.nextInt();
            switch (choose) {
                case 1:
                    tuyenSinh.addInfor();
                    break;
                case 2:
                    tuyenSinh.showInfor();
                    break;
                case 3:
                    System.out.print("Nhap ID de tim kiem thi sinh: ");
                    int id = scanner.nextInt();
                    tuyenSinh.findByID(id);
                    break;
                case 4:
                    //return; // thoat khoi chuong trinh
                    System.exit(0);
                default:
                    System.out.println("Vui lòng chọn chức năng theo đúng số!");
                    break;
            }
        }
    }
}

