package Exercise1.backend;

import java.util.Scanner;

import Exercise1.entity.QLCB;

public class Exercise5 {

    public void question1_2() {
        Scanner scanner = new Scanner(System.in);
        QLCB qlcb = new QLCB();

        System.out.println("Mời bạn nhập vào chức năng muốn dùng\n" + "1.Thêm mới cán bộ\n" + "2.Tìm kiếm theo họ tên\n"
                + "3.Hiện thị thông tin về danh sách các cán bộ.\n" + "4.Nhập vào tên của cán bộ và delete cán bộ đó\n"
                + "5.Thoát khỏi chương trình.");
//        System.out.println("Mời bạn chọn chức năng: ");
//        int choose = scanner.nextInt();
        while (true) {
            System.out.print("Mời bạn chọn chức năng: "); // bỏ dòng 16 và 17 vào trong vòng lặp vô hạn while(true)
                                                          // nếu không thì biến choose sẽ luôn có một giá trị được nhập vào từ ban đầu và không thay đổi
                                                          // cho nên một case khi được gọi đến thì nó sẽ lặp vô hạn case đó
            int choose = scanner.nextInt();
            switch (choose) {
                case 1:
                    qlcb.addCanBo();
                    break;
                case 2:
                    qlcb.findByName();
                    break;
                case 3:
                    qlcb.printListCanBo();
                    break;
                case 4:
                    qlcb.deleteCanBo();
                    break;
                case 5:
                    return;
                default:
                    System.out.println("Bạn đã nhập sai. Bạn chỉ được nhập từ 1 tới 5 thôi!");
                    break;
            }
        }
    }
}
