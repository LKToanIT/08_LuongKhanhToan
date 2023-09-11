package org.example.Testing_System_Assignment_8;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Scanner;

public class ScannerUltis {
    private static Scanner sc = new Scanner(System.in);
    public static int inputInt() {
        while(true) {
            try {
                return Integer.parseInt(sc.next().trim());
            }
            catch (Exception e) {
                System.err.println("Nhap lai: ");
            }
        }
    }

    public static int inputIntPositive() {
        while (true) {
            try {
                int intPositive = Integer.parseInt(sc.next());
                if (intPositive >= 0) {
                    return intPositive;
                } else {
                    System.err.println("Nhap lai: ");
                }
            }
            catch (Exception e) {
                System.err.println("Nhap lai: ");
            }
        }
    }

    public static Float inputFloat(String mes) {
        while (true) {
            try {
                return Float.parseFloat(sc.next());
            } catch (Exception e) {
                System.err.println("Nhap lai: ");
            }
        }
    }

    public static Double inputDouble() {
        while (true) {
            try {
                return Double.parseDouble(sc.next());
            } catch (Exception e) {
                System.err.println("Nhap lai: ");
            }
        }
    }

    public static String inputString() {
        while (true) {
            String string = sc.nextLine().trim();
            if (!string.isEmpty()) {
                return string;
            } else {
                System.err.println("Nhap lai: ");
            }
        }
    }

    public static LocalDate inputLocalDate() {
        System.out.println("Nhap theo dinh dang yyyy-MM--dd");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        while (true) {
            String localDate = sc.next().trim();
            try {
                if (format.parse(localDate) != null) {
                    LocalDate localDate1 = LocalDate.parse(localDate);
                    return localDate1;
                }
            } catch (Exception e) {
                System.err.println("Nhap lai: ");
            }
        }
    }



}
