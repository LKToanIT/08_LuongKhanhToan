package org.example.Exercise_1.Question_2;

public class TT_thisinh {
    public static int dem = 0;
    private int idNumber;
    private String name;
    private String address;
    private int priority;
    private Block block;

    public int getIdNumber() {
        return idNumber;
    }

    public TT_thisinh(String name, String address, int priority, Block block) {
        dem ++;
        this.idNumber = dem;
        this.name = name;
        this.address = address;
        this.priority = priority;
        this.block = block;
    }

    public void hienThiThongTinThiSinh() {
        System.out.println("IDNumber: " + idNumber);
        System.out.println("Tên thí sinh: " + name);
        System.out.println("Địa chỉ: " + address);
        System.out.println("Mức độ ưu tiên: " + priority);
        System.out.println("Khối: " + block.getName());
        System.out.println("Tổ hợp môn khối " + block.getName() + ": " + block.getSubject());
    }
}
