package org.example.Exercise_1.Question_2;

public class Block {
    private String name;
    private String subject;
    public Block(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }
    public String getSubject() {
        switch (this.name) {
            case "a":
                this.subject = "toan, ly, hoa";
                break;
            case "b":
                this.subject = "toan, hoa, sinh";
                break;
            case "c":
                this.subject = "van, su, dia";
                break;
        }
        return this.subject;
    }
}
