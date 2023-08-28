package org.example.Testing_System_Assignment_2;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Locale;

public class Exercise_2 {
    public static void main(String[] args) {
        //question 1
        byte a = 5;
        System.out.println(a);

        //question 2
        int b = 100_000_000;
        System.out.println(b);

        //question 3
        float c = 5.567098f; // phần thập phân phân cách với phần nguyên bằng dấu chấm '.'
        System.out.printf("%.4f", c);

        //question 4
        String ten = "\"Phan Văn Phúc\"";
        System.out.println("\nTên tôi là: " + ten);

        //question 5
        String pattern = "dd/MM/yyyy HH:mm:ss";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String date = simpleDateFormat.format(new Date());
        System.out.println(date);

    }
}
