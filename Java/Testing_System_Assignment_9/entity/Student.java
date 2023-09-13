package org.example.Testing_System_Assignment_9.entity;

public class Student {
    public static int count = 0;
    private int id;
    private String name;
    public Student(String name) {
        this.id = ++count;
        this.name = name;
    }
    @Deprecated
    public int getId() {
        return id;
    }

    public String newGetId() {
        return "MSV: " + id;

    }

    @Override
    public String toString() {
        return "Student{" + "id=" + id + ", name='" + name + '\'' + '}';
    }

    public static void main(String[] args) {
        Student student = new Student("nguyen van a");
        System.out.println(student.name);
        System.out.print("GetID cu: ");
        System.out.println(student.getId());
        System.out.print("GetID moi: ");
        System.out.println(student.newGetId());
    }
}
