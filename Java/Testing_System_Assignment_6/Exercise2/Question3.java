package Exercise2;

public class Question3 {
    public static void main(String[] args) {
        int[] numbers = {1, 2, 3};
        try {
            System.out.println(numbers[10]);
        }
        catch (ArrayIndexOutOfBoundsException arrayIndexOutOfBoundsException) {
            System.out.println("Trong mang khong co phan tu thu 10");
        }
    }
}
