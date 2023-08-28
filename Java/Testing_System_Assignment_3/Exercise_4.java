package org.example.Testing_System_Assignment_3;

import java.util.Scanner;

public class Exercise_4 {
    public static void main(String[] args) {
        //khai báo một scanner và không đóng nó khi mỗi hàm kết thúc nếu không sẽ gây lỗi
//        question1();
//        question2();
//        question3();
//        question4();
//        question5();
//        question6();
//        question7();
    }

    //question 1 :
    public static void question1() {
        String s;
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhap chuoi s: ");
        s = scanner.nextLine();
        String[] numberWords = s.split(" ");
        //xem thêm trường hợp có 2 dấu cách liền nhau
        System.out.println("So tu trong chuoi: " + numberWords.length);
    }

    //question 2
    public static void question2() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhap chuoi s1: ");
        String s1 = scanner.nextLine();
        System.out.print("Nhap chuoi s2: ");
        String s2 = scanner.nextLine();
        System.out.println("Chuoi s1 + s2 = " + s1 + " " + s2);
    }

    //question 3
    public static void question3() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhap vao ten: ");
        String name = scanner.nextLine();
        String firstChar = name.substring(0,1).toUpperCase();
        //substring(0,1) :lấy 1 kí tự có index = 0
        System.out.println("Kí tự đầu tiên trong chuỗi: " + firstChar);
        String leftChar = name.substring(1);
        //leftChar chứa các kí tự còn lại trong chuỗi trừ kí tự đầu tiên
        //substring(1) : lấy tất cả các phần tử bắt đầu từ phần tử có index = 1, nghĩa là sẽ bỏ phần tử đầu tiên
        System.out.println("Các kí tự còn lại trong chuỗi: " + leftChar);
        name = firstChar + leftChar;
        System.out.println("Chuỗi sau khi in hoa kí tự đầu tiên: " + name);

    }

    //question 4
    public static void question4() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhap ten: ");
        String name = scanner.nextLine();
        for (int i = 0; i < name.length(); i++) {
                System.out.println("Ki tu thu " + (i+1) + ": " + name.toUpperCase().charAt(i));
        }
    }

    //question 5
    public static void question5() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập họ: ");
        String lastName = scanner.nextLine();
        System.out.print("Nhập tên: ");
        String firstName = scanner.nextLine();
        String fullName = lastName + " " + firstName;
        System.out.println("Họ và tên: " + fullName);
    }

    //question 6
    public static void question6(){
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập họ tên đầy đủ: ");
        String fullName = scanner.nextLine();
        String[] middle = fullName.split(" ");
        String lastName = middle[0];
        String firstName = middle[middle.length - 1];//tên là phần tử cuối trong mảng
        String middleName ="";//cần phải khởi tạo giá trị để tính toán trong for loop
        for (int i=1; i<=(middle.length-2); i++) {//tên đệm có thể hơn 1 từ nên dùng for loop
            middleName += middle[i] + " ";
        }
        System.out.println("Họ: " + lastName);
        System.out.println("Tên đệm: " + middleName.replaceAll("\s+", " "));
        System.out.println("Tên: " + firstName);
    }

    //question 7
    public static void question7(){
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập họ tên đầy đủ: ");
        String fullName = scanner.nextLine();
        fullName = fullName.trim();//xóa khoảng trắng ở đầu và cuối chuỗi
        fullName = fullName.replaceAll("\s+"," ");
        //phương thức replaceAll : thay thế regex = replacement
        //regex(biểu thức chính quy) - kí hiệu của khoảng trắng trong java là "\s"
        //"\s+" để chỉ nhiều khoảng trắng liền nhau
        System.out.println("Test: " + fullName);
        String[] elementInFullName = fullName.split(" ");//cắt chuỗi theo khoảng trắng, biến mỗi một từ trong tên(fullName)
                                                               //thành một phần tử của mảng elementInFullName
        fullName ="";
        for (String element: elementInFullName//in hoa kí tự đầu tiên trong mỗi phần tử của mảng elementInFullName
             ) {
            String firstChar = element.substring(0,1).toUpperCase();
            String leftChar = element.substring(1);
            element = firstChar + leftChar;
            fullName += element + " ";
        }
        System.out.println("Họ tên sau chuẩn hóa: " + fullName);
    }
}
