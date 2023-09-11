package Exercise2;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Question4 {
    static Scanner s = new Scanner(System.in);
    static Department[] departments = new Department[3];
    public void nhapThongTin() {
        System.out.println("NHAP THONG TIN PHONG BAN");
        for (int i=0; i<3; i++) {
            System.out.print("Nhap so ID phong ban: ");
            int id = s.nextInt();
            System.out.print("Nhap ten phong ban:");
            String name = s.next();
            departments[i] = new Department(id, name);
        }
    }
    public void hienThiThongTin() {
        System.out.println("THONG TIN CAC PHONG BAN DA NHAP: ");
        for (int i=0; i<3; i++) {
            System.out.print("Phong ban thu " + (i+1) + ": ");
//            System.out.println("ID: " + departments[i].departmentID + ", Ten: " + departments[i].departmentName);
            System.out.println(departments[i]);//do trong class Department đã ghi đè phương thức toString nên chỉ cần in ra đối tượng là phương thức
                                               //toString của đối tượng sẽ được gọi đến
        }
    }
    public void getIndex(int index) {
        try {
            System.out.print("Thong tin phan tu thu " + (index+1) + ": ");//dòng này luôn luôn được in ra dù có tìm được thông tin phần tử hay không
            System.out.println(departments[index]);
        }
        catch (ArrayIndexOutOfBoundsException arrayIndexOutOfBoundsException) {
            System.out.println("Cannot find department!");
        }
    }

    public static void main(String[] args) {
//        Department department = new Department(1, "sale");
//        System.out.println(department);
        Question4 question4 = new Question4();
        question4.nhapThongTin();
        question4.hienThiThongTin();
        System.out.print("Nhap index (index bat dau tu 0): ");
        int index = s.nextInt();
        question4.getIndex(index);
        s.close();
    }
}
