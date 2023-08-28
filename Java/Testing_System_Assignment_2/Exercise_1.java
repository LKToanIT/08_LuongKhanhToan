package org.example.Testing_System_Assignment_2;

import java.time.LocalDate;
import java.util.Locale;

public class Exercise_1 {
    public static void main(String[] args) {
        // Create group
        Group group1 = new Group();
        group1.id = 1;
        group1.name = "Java Fresher";
        group1.createDate = LocalDate.of(2020, 04, 21);

        Group group2 = new Group();
        group2.id = 2;
        group2.name = "DB Fresher";
        group2.createDate = LocalDate.of(2020, 04, 21);

        Group group3 = new Group();
        group3.id = 3;
        group3.name = "C++ Fresher";
        group3.createDate = LocalDate.of(2020, 04, 16);

        // Create Deparment
        Department department1 = new Department();
        department1.id = 1;
        department1.name = "Sale";

        Department department2 = new Department();
        department2.id = 2;
        department2.name = "Marketting";

        Department department3 = new Department();
        department3.id = 3;
        department3.name = "HR";

        // Create Position
        Position position1 = new Position();
        position1.id = 1;
        position1.name = "Manager";

        Position position2 = new Position();
        position2.id = 2;
        position2.name = "Team Leader";

        Position position3 = new Position();
        position3.id = 3;
        position3.name = "Trainee";

        // Create account
        Account account1 = new Account();
        account1.id = 1;
        account1.createDate = LocalDate.of(2020, 03, 17);
        account1.department = department1;
        account1.email = "An@gmail.com";
        account1.fullName = "Nguyen Van An";
        account1.position = position1;
        account1.userName = "an.nguyenvan";

        Account account2 = new Account();
        account2.id = 2;
        account2.createDate = LocalDate.of(2020, 01, 9);
        account2.department = department1;
        account2.email = "Linh@gmail.com";
        account2.fullName = "Nguyen Hoai Linh";
        account2.position = position3;
        account2.userName = "Linh.nguyenhoai";

        Account account3 = new Account();
        account3.id = 3;
        account3.createDate = LocalDate.of(2020, 03, 19);
        account3.department = department2;
        account3.email = "ha@gmail.com";
        account3.fullName = "Pham Hai Ha";
        account3.position = position1;
        account3.userName = "Ha.phamhai";

        //add group to account
        Group[] groupOfAccount1 = { group1 };
        account1.groups = groupOfAccount1;

        Group[] groupOfAccount2 = { group1, group2 };
        account2.groups = groupOfAccount2;

        account2.groups = new Group[] {group1, group2};

        Group[] groupOfAccount3 = { group1, group2, group3 };
        account3.groups = groupOfAccount3;

        // add account to group : sử dụng cho question 5
        Account[] accountOfGroups1 = { account1, account2, account3 };
        group1.accounts = accountOfGroups1;


    /*    System.out.println("Sử dụng if else:");
        //question 1
        System.out.println("Question 1:");
        if(account2.department == null) {
            System.out.println("Nhân viên này chưa có phòng ban nào.");
        }
        else {
            System.out.println("Phòng ban của nhân viên này là: " + account2.department.name);
        }

        //question 2 : groups.length - đếm số lượng phần tử trong mảng groups
        System.out.println("Question 2:");
        if (account2.groups == null || account2.groups.length == 0) {
            System.out.println("Nhân viên này chưa có group nào");
        } else if (account2.groups.length == 1) {
            System.out.println("Group của nhân viên này là : " + account2.groups[0].name);
        } else if (account2.groups.length == 2) {
            System.out.println("Group của nhân viên này là : " + account2.groups[0].name + ", " + account2.groups[1].name);
        } else if (account2.groups.length == 3) {
            System.out.println("Nhân viên này quan trọng, tham gia nhiều group");
        } else if (account2.groups.length == 4) {
            System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
        }

        //question 3 : sử dụng toán tử ternary (toán tử 3 ngôi - ?) làm question 1
        System.out.println("Question 3:");
        String dept = account2.department == null ? "Nhân viên này chưa có phòng ban" : "Phòng ban của nhân viên này là: " + account2.department.name;
        System.out.println(dept);

        //question 4 :
        System.out.println("Question 4:");
        String q4 = account1.position.name == "DEV" ? "Đây là Developer" : "Người này không phải Developer";
        System.out.println(q4);
    */

    /*
        // switch case
        System.out.println("\nSử dụng switch case:");

        //question 5
        System.out.println("Question 5:");
        switch (group1.accounts.length) { // lấy số phần tử mảng accounts trong class group thông qua đối tượng group1
            case 1:
                System.out.println("Nhóm có 1 thành viên");
                break;
            case 2:
                System.out.println("Nhóm có 2 thành viên");
                break;
            case 3:
                System.out.println("Nhóm có 3 thành viên");
                break;
            default:
                System.out.println("Nhóm có nhiều thành viên");
        }

        //question 6 : dùng switch case làm lại question 2
        System.out.println("Question 6:");
        switch (account2.groups.length) {
            case 1:
                System.out.println("Group của nv này là: " + account2.groups[0].name);
                break;
            case 2:
                System.out.println("Group của nv này là: " + account2.groups[0].name + ", " + account2.groups[1].name);
                break;
            case 3:
                System.out.println("Nv này là người quan trọng, tham gia nhiều group");
                break;
            case 4:
                System.out.println("Nv này thích hóng chuyện");
                break;
            default:
                System.out.println("Nhân viên này chưa có group");
        }

        //question 7 : làm lại question 4
        System.out.println("Question 7:");
        switch (account1.position.name) {
            case "DEV":
                System.out.println("Đây là Developer");
                break;
            default:
                System.out.println("Người này không phải là Developer");
        }

        System.out.println("\nFor each:");
        //question 8
        Account[] accounts = {account1, account2, account3};
        System.out.println("Question 8:");
        for (Account a : accounts
             ) {
            System.out.println("Email: " + a.email);
            System.out.println("Full Name: " + a.fullName);
            System.out.println("Department Name: " +a.department.name + "\n");
        }
        
        //question 9
        System.out.println("Question 9:");
        Department[] departments = {department1, department2, department3};
        for (Department d:departments
             ) {
            System.out.println("ID: " + d.id);
            System.out.println("Name: " + d.name + "\n");
        }
    */
        //for
        System.out.println("\nFor loop:");
        //question 10
        Account[] accounts = {account1, account2, account3};
        System.out.println("Question 10:");
        for (int i = 0; i < accounts.length; i++) {
            System.out.println("Thông tin account thứ " + (i+1) + " là:");
            System.out.println("Email: " + accounts[i].email);
            System.out.println("Full Name: " + accounts[i].fullName);
            System.out.println("Phòng ban: " + accounts[i].department.name + "\n");
        }

        //question 11
        Department[] departments = {department1, department2, department3};
        System.out.println("Question 11:");
        for (int i = 0; i < departments.length; i++) {
            System.out.println("Thông tin department thứ " + (i+1) + " :");
            System.out.println("ID: " + departments[i].id);
            System.out.println("Department Name: " + departments[i].name);
        }

        //question 12
        System.out.println("Question 12:");
        for (int i = 0; i < 2; i++) {
            System.out.println("Thông tin department thứ " + (i + 1) + " là:");
            System.out.println("ID: " + departments[i].id);
            System.out.println("Name: " + departments[i].name);
        }

        //question 13 : không in ra thông tin account thứ 2
        System.out.println("Question 13:");
        for (int i = 0; i < accounts.length; i++) {
            if (i != 1) {
                System.out.println("Thông tin account thứ " + (i + 1) + " là:");
                System.out.println("Email: " + accounts[i].email);
                System.out.println("Full Name: " + accounts[i].fullName);
                System.out.println("Phòng ban: " + accounts[i].department.name + "\n");
            }
        }

        //question 14
        System.out.println("Question 14:");
        for (int i = 0; i < accounts.length; i++) {
            if (accounts[i].id < 4) {
                System.out.println("Thông tin account thứ " + (i + 1) + " là:");
                System.out.println("Email: " + accounts[i].email);
                System.out.println("Full Name: " + accounts[i].fullName);
                System.out.println("Phòng ban: " + accounts[i].department.name + "\n");
            }
        }

        //question 15:
        System.out.println("Question 15:");
        System.out.println("Các số chẵn <= 20: ");
        for (int i = 0; i <= 20; i++) {
            if (i % 2 == 0) {
                System.out.print(i + " ");
            }
        }
        System.out.println("\n");

        //question 16
        System.out.println("While loop:");
        System.out.println("\nQuestion 16:");
        int i = 0;
        System.out.println("q10:");
        while (i < accounts.length) {
            System.out.println("Thông tin account thứ " + (i + 1) + " là:");
            System.out.println("Email: " + accounts[i].email);
            System.out.println("Full Name: " + accounts[i].fullName);
            System.out.println("Phòng ban: " + accounts[i].department.name + "\n");
            i++;
        }

        i = 0;
        System.out.println("q11:");
        while (i < accounts.length) {
            System.out.println("Thông tin department thứ " + (i + 1) + " là:");
            System.out.println("ID: " + departments[i].id);
            System.out.println("Name: " + departments[i].name);
            i++;
        }

        System.out.println("\nq12:");
        i = 0;
        while (i < 2) {
            System.out.println("Thông tin department thứ " + (i + 1) + " là:");
            System.out.println("ID: " + departments[i].id);
            System.out.println("Name: " + departments[i].name);
            i++;
        }

        System.out.println("\nq13");
        i = 0;
        while (i < accounts.length) {
            if (i == 1) {
                i++;
                continue;
            }
            System.out.println("Thông tin department thứ " + (i + 1) + " là:");
            System.out.println("ID: " + departments[i].id);
            System.out.println("Name: " + departments[i].name);
            i++;
        }

        System.out.println("\nq14:");
        i = 0;
        while (i < accounts.length) {
            if (accounts[i].id < 4) {
                System.out.println("Thông tin account thứ " + (i + 1) + " là:");
                System.out.println("Email: " + accounts[i].email);
                System.out.println("Full Name: " + accounts[i].fullName);
                System.out.println("Phòng ban: " + accounts[i].department.name + "\n");
                i++;
            }
        }

        System.out.println("\nq15 - các số chẵn <= 20:");
        i = 0;
        while (i <= 20) {
            if (i % 2 == 0) {
                System.out.print(i + " ");
            }
            i++;
        }

        //do while
        System.out.println("\n\ndo while loop:");
        System.out.println("Question 17:");
        System.out.println("17.11:");
        i = 0;
        do {
            System.out.println("Thông tin account thứ " + (i + 1) + " là:");
            System.out.println("Email: " + accounts[i].email);
            System.out.println("Full Name: " + accounts[i].fullName);
            System.out.println("Phòng ban: " + accounts[i].department.name + "\n");
            i++;
        } while (i < accounts.length);

        System.out.println("17.13:");
        i = 0;
        do {
            if (i == 1) {
                i++;
                continue;
            }
            System.out.println("Thông tin account thứ " + (i + 1) + " là:");
            System.out.println("Email: " + accounts[i].email);
            System.out.println("Full Name: " + accounts[i].fullName);
            System.out.println("Phòng ban: " + accounts[i].department.name + "\n");
            i++;
        } while (i < accounts.length);
    }
}
