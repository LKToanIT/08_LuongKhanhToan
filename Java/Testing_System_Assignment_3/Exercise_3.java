package org.example.Testing_System_Assignment_3;

public class Exercise_3 {
    public static void main(String[] args) {
        question1();
        question2();
        question3();
    }
    //question 1
    public static void question1(){
        Integer salary = Integer.valueOf(5000);
        System.out.printf("Float Salary: %.2f%n", (float) salary);
    }

    //question 2
    public static void question2(){
        String s1 = new String("1234567");
        int int1 = Integer.parseInt(s1);
        System.out.println("String convert to int: " + int1);
    }

    //question 3
    public static void question3() {
        Integer int2 = Integer.valueOf(1234567);
        int int3 = int2.intValue();
        System.out.println("Integer convert to int: " + int3);
        System.out.println("int2 = int3: " + (int2.equals(int3)));
    }
}
