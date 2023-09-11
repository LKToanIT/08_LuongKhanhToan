package org.example.Exercise_1.Question_2;

import java.util.ArrayList;
import java.util.Scanner;

public class Tuyen_sinh implements Interface_Tuyen_Sinh {
    private ArrayList<TT_thisinh> listThiSinh;
    private Scanner scanner;
    public Tuyen_sinh() {
        listThiSinh = new ArrayList<TT_thisinh>();
        scanner = new Scanner(System.in);
    }

    @Override
    //nhap thong tin thi sinh
    public void addInfor() {
        System.out.print("Nhập tên thí sinh: ");
        String name = scanner.nextLine();
        System.out.print("Nhập địa chỉ thí sinh: ");
        String address = scanner.nextLine();
        System.out.print("Mức ưu tiên (nhập số): ");
        int priority = scanner.nextInt(); // nhập một số nguyên, sau số nguyên đó vẫn còn một khoảng trắng chưa được xử lí vì khoảng trắng không phải số

        scanner.nextLine();// nhập chuỗi bằng nextLine sau khi nhập một số thì phải có dòng này

        System.out.print("Nhập khối (viết thường): ");// nếu không có lệnh ở trên thì kí tự khoảng trắng còn lại sau khi nhập số nguyên sẽ được chèn thẳng vào blockName
                                        // và người dùng sẽ không nhập được blockName từ bàn phím
        String blockName = scanner.nextLine();
        TT_thisinh thiSinh = new TT_thisinh(name, address, priority, new Block(blockName));
        listThiSinh.add(thiSinh);
    }

    //hien thi thong tin thi sinh
    @Override
    public void showInfor() {
        if (listThiSinh.isEmpty()) {
            System.out.println("Danh sách chưa có thí sinh nào để hiển thị!");
        }
        else {
            System.out.println("THÔNG TIN THÍ SINH:");
            for (TT_thisinh i : listThiSinh
            ) {
                i.hienThiThongTinThiSinh();
            }
        }
    }

    //tim thi sinh theo id cua thi sinh
    @Override
    public void findByID(int id) {
        if (listThiSinh.isEmpty()) {
            System.out.println("Danh sách chưa có thí sinh nào để tìm kiếm!");
        }
        for (TT_thisinh i:listThiSinh
             ) {
            if(i.getIdNumber() == id) {
                i.hienThiThongTinThiSinh();
            }
        }
    }
}
