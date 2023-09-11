package org.example.Testing_System_Assignment_8.backend;

import org.example.Testing_System_Assignment_8.ScannerUltis;
import org.example.Testing_System_Assignment_8.Student;

import java.util.*;

public class Exercise1 {
    private List<Student> studentList;
    public Exercise1() {
        studentList = new ArrayList<Student>();
        System.out.println("Nhập số sinh viên muốn thêm: ");
        int number = ScannerUltis.inputIntPositive(); // nhập số học sinh muốn thêm vào list, đảm bảo nó là một số nguyên dương bằng ScannerUltis.inputIntPositive
        for (int i=0; i<number-3; i++) { //thêm vào học sinh trừ 3 học sinh mặc định theo đề bài
            Student student = new Student("New student " + (i+1));
            studentList.add(student);
        }
        Student student1 = new Student("no name");
        Student student2 = new Student("no name");
        Student student3 = new Student("no name");
        studentList.add(student1);
        studentList.add(student2);
        studentList.add(student3);
    }

    public void menuQuestion1() {
        System.out.println("LỰA CHỌN CHỨC NĂNG TƯƠNG ỨNG");
        System.out.println("1 - In ra tổng số phần tử của trong list");
        System.out.println("2 - Lấy ra phần tử thứ 4");
        System.out.println("3 - In ra phần tử đầu và cuối");
        System.out.println("4 - Thêm một phần tử vào đầu list");
        System.out.println("5 - Thêm một phần tử vào cuối list");
        System.out.println("6 - Đảo ngược vị trí các phần tử");
        System.out.println("7 - Tìm kiếm student theo ID");
        System.out.println("8 - Tìm kiếm student theo tên");
        System.out.println("9 - In ra các student có tên trùng nhau");
        System.out.println("10 - Xóa tên student theo ID");
        System.out.println("11 - Xóa thông tin student theo ID");
        System.out.println("12 - Tạo 1 ArrayList có tên studentCopies và add tất cả students vào studentCopies");
        System.out.println("13 - Thoát chương trình");
    }

    //in ra thông tin học sinh trong list bằng for each loop
    private void printStudent() {
        for (Student student:studentList) {
            System.out.println(student);// chỉ cần gọi đến student là phương thức toString sẽ được gọi đến
        }
    }
    public void question1() {
        menuQuestion1();
        while (true) {
            int choose = ScannerUltis.inputIntPositive();// đảm bảo đầu vào là một số nguyên dương
            switch (choose) {
                case 1:// in tổng số sinh viên
                    System.out.println("Tổng số sinh viên trong list: " + studentList.size());
                    printStudent();
                    break;
                case 2:// lấy ra phần tử thứ 4
                    System.out.println("Phần tử thứ 4: " + studentList.get(3));
                    break;
                case 3:// lấy ra phần tử đầu tiên và cuối cùng
                    System.out.println("Phần tử đầu tiên: " + studentList.get(0));
                    System.out.println("Phần tử cuối cùng: " + studentList.get(studentList.size() - 1));
                    break;
                case 4:// thêm tên sv vào đầu list
                    System.out.print("Nhập tên sinh viên cần thêm vào đầu list: ");
                    String tenSvDau = ScannerUltis.inputString();
                    studentList.add(0, new Student(tenSvDau));// add(index, student element): thêm một phần tử vào studentList ở vị trí chỉ định
                                                                    // add vào index = 0 tương ứng với vị trí đầu tiên trong list
                    printStudent();
                    break;
                case 5:// thêm sv vào cuối list
                    System.out.print("Nhập tên sinh viên cần thêm vào cuối list: ");
                    String tenSvCuoi  = ScannerUltis.inputString();
                    studentList.add(new Student(tenSvCuoi));// phương thức add(): thêm phần tử vào cuối list
                    printStudent();
                    break;
                case 6:// đảo ngược studentList bằng Collections.reverse
                    Collections.reverse(studentList);
                    System.out.println("List sau khi đảo ngược vị trí : ");
                    printStudent();
                    break;
                case 7:// tìm kiếm thông tin sv theo ID
                    System.out.print("Nhập ID cần tìm kiếm : ");
                    int idCase7 = ScannerUltis.inputIntPositive();
                    for (Student student : studentList)
                    {
                        if (student.getId() == idCase7)
                        {
                            System.out.println(student);
                        }
                    }
                    break;
                case 8:// tìm kiếm sv theo tên sv
                    System.out.println("Nhập tên cần tìm: ");
                    String nameCase8 = ScannerUltis.inputString();
                    for (Student student: studentList)
                    {
                        if (student.getName().equals(nameCase8))
                        {
                            System.out.println(student);
                        }
                    }
                case 9:// in ra các sinh viên trùng tên
                    System.out.println("Các sinh viên trùng tên: ");
                    for (int i=0; i<studentList.size(); i++) {
                        for (int j=i+1; j<studentList.size(); j++) {
                            if (studentList.get(i).getName().equals(studentList.get(j).getName())) {
                                System.out.println(studentList.get(i).toString());
                            }
                        }
                    }
                    break;
                case 10:// xóa tên theo ID
                    System.out.println("Nhập vào ID cần xóa tên:");
                    int idCase10 = ScannerUltis.inputIntPositive();
                    for (Student student: studentList) {
                        if (student.getId() == idCase10) {
                            student.setName(null);// set giá trị null cho name với ID người dùng nhập vào = xóa name
                        }
                    }
                    printStudent();
                    break;
                case 11:// xóa thông tin sv theo ID
                    System.out.println("Nhập vào ID của student cần xóa: ");
                    int idCase11 = ScannerUltis.inputIntPositive();
                    studentList.removeIf(student -> student.getId() == idCase11);
                    printStudent();
                    break;
                case 12:
                    System.out.println("Tạo mới arraycopies:");
                    List<Student> arrayCopies = new ArrayList<Student>();
                    arrayCopies.addAll(studentList);// addAll(): thêm các phần tử trong studentList vào cuối list arrayCopies
                    System.out.println("In arrayCopies:");
                    for (Student student : arrayCopies) {
                        System.out.println(student);
                    }
                    break;
                case 13:
                    System.exit(0);
                default:
                    System.out.println("Chọn đúng số tương ứng");
                    break;
            }
        }
    }

}
