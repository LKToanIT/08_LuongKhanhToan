package org.example.Testing_System_Assignment_8;

public class Student {
    public static int count = 0;
    private int id;
    private String name;

    public Student(String name) {
        super();
        this.id = ++count;
        this.name= name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Student{" + "id=" + id + ", name='" + name + '\'' + '}';
    }
}
