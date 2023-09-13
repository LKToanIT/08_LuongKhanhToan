package org.example.Testing_System_Assignment_9.entity;

public class NgayThangNam {
    public int ngay, thang, nam;

    public class GioPhutGiay {
        public int gio, phut, giay;
        public void xuatThongTin() {
            System.out.println("ngay " + ngay + ", thang " + thang + ", nam " + nam);
            System.out.println("gio " + gio + ", phut " + phut + ", giay " + giay);
        }
    }

    public static void question4() {
        NgayThangNam date = new NgayThangNam();
        date.ngay = 31;
        date.thang = 12;
        date.nam = 2003;

        /*NgayThangNam.*/
        GioPhutGiay time = date.new GioPhutGiay();// không cần outerclass đứng trước
        time.gio = 10;
        time.phut = 15;
        time.giay = 30;
        time.xuatThongTin();
    }
}
