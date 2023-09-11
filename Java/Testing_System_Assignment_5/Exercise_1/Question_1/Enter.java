package org.example.Exercise_1.Question_1;

import java.util.ArrayList;
import java.util.Scanner;

public class Enter {
    private Scanner scanner;
    private ArrayList<News> listNews;
    public Enter() {
        scanner = new Scanner(System.in);
        listNews = new ArrayList<News>();
    }
    public void question1() {
        loadMenu();
    }
    private void loadMenu() {
        while (true) {
            System.out.println("===========================");
            System.out.println("LỰA CHỌN CHỨC NĂNG THEO SỐ");
            System.out.println("1 - Insert news");
            System.out.println("2 - View list news");
            System.out.println("3 - Average rate");
            System.out.println("4 - Exit");
            System.out.println("============================");

            int choose = scanner.nextInt();
            switch (choose) {
                case 1:
                    System.out.print("Nhập title: ");
                    String title = scanner.next();
                    System.out.print("Nhập publish date: ");
                    String publishDate = scanner.next();
                    System.out.print("Nhập author: ");
                    String author = scanner.next();
                    System.out.print("Nhập content: ");
                    String content = scanner.next();
                    System.out.print("\nNhập giá trị 1: ");
                    int rate1 = scanner.nextInt();
                    System.out.print("\nNhập giá trị 2: ");
                    int rate2 = scanner.nextInt();
                    System.out.print("\nNhập giá trị 3: ");
                    int rate3 = scanner.nextInt();
                    int[] rates ={rate1, rate2, rate3};
                    News new1 = new News(title, publishDate, author, content, rates);
                    listNews.add(new1);
                    break;

                case 2:
                    for (News i:listNews
                         ) { i.display();
                    }
                    break;
                case 3:
                    System.out.println("Đánh giá trung bình: ");
                    for (News i: listNews
                         ) {
                        System.out.println("Title: " + i.getTitle() + ", Rate AVG: " + i.caculate());
                    }
                    break;
                case 4:
                    return;
                default:
                    System.out.println("LỰA CHỌN ĐÚNG SỐ!");
                    break;
                    }
        }
    }
}
