package Exercise2;

public class Department {
    int departmentID;
    String departmentName;
    public Department(int id, String name) {
        departmentID = id;
        departmentName = name;
    }

    @Override
    public String toString() {
        return "ID: " + departmentID + ", Ten: " + departmentName;
    }
}
