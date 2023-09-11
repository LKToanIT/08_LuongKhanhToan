package org.example.Exercise_1.Question_1;

public class News implements INews {
    private int id;
    private String title;
    private String publishDate;
    private String author;
    private String content;
    private Float averageRate;
    private int[] Rates;
    public static int dem = 0;
    public News(String title, String publishDate, String author, String content, int[] Rates) {
        dem++;
        this.id = dem;
        this.title = title;
        this.publishDate = publishDate;
        this.author = author;
        this.content = content;
        this.averageRate = averageRate;
        this.Rates = Rates;
    }


    public void setRate(int[] rate) {
        this.Rates = rate;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public int[] getRate() {
        return Rates;
    }

    public int getId() {
        return id;
    }
    public String getTitle() {
        return title;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public String getAuthor() {
        return author;
    }

    public String getContent() {
        return content;
    }

    public Float getAverageRate() {
        return averageRate;
    }

    @Override
    public void display() {
        System.out.println("Title: " + title);
        System.out.println("PublishDate: " + publishDate);
        System.out.println("Author: " + author);
    }

    @Override
    public float caculate() {
        averageRate = (float) ((Rates[0] + Rates[1] + Rates[2]) / 3);
        return averageRate;
    }
}
