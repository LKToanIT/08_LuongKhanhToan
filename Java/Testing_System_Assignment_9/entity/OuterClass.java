package org.example.Testing_System_Assignment_9.entity;

public class OuterClass {
    public OuterClass() {
        System.out.println("Constructor of outer class");// InnerClass sẽ gọi đến Constructor của OuterClass
    }
    public void show() {
        InnerClass innerclass = new InnerClass();
        innerclass.show();
    }

    public class InnerClass {
        public void show() {
            System.out.println("Day la Inner Class");
        }
    }

    public static void question3() {
        OuterClass outerClass = new OuterClass();
        outerClass.show();

        OuterClass.InnerClass innerClass = outerClass.new InnerClass();
        innerClass.show();
    }
}
