package org.example.Testing_System_Assignment_2;

import java.time.LocalDate;
import java.util.Locale;
import java.util.Random;

public class Exercise_4 {
    public static void main(String[] args) {
        Random random = new Random();

        //in ngẫu nhiên ra một số nguyên
        System.out.print("In ngẫu nhiên ra một số nguyên: ");
        int x = random.nextInt();
        System.out.println(x);

        //in ngẫu nhiên ra một số thực
        System.out.print("In ngẫu nhiên ra một số thực: ");
        float y = random.nextFloat();
        System.out.println(y);

        //question 3 : random index trong mảng nameOfStudents
        System.out.println("In ra một phần tử ngẫu nhiên trong mảng: ");
        String[] nameOfStudents = {"phúc", "trường", "quân", "huỳnh"};
        int randomNameOfStudents = random.nextInt(nameOfStudents.length);
        System.out.println(nameOfStudents[randomNameOfStudents]);

        //question 4: random một ngày trong khoảng 24/7/1995 - 20/12/1995
        System.out.println("In ra một ngày ngẫu nhiên trong khoảng 24/7/1995 - 20/12/1995:");
        int minDay = (int) LocalDate.of(1995,07,24).toEpochDay();
        int maxDay = (int) LocalDate.of(1995,12,20).toEpochDay();
        long randomInt = minDay + random.nextInt(maxDay - minDay);
        LocalDate randomDay = LocalDate.ofEpochDay(randomInt);
        System.out.println(randomDay);

    }
}
