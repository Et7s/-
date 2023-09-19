import java.security.NoSuchAlgorithmException;
import java.util.Random;
import java.util.Arrays;
public class Main {
    public static void main(String[] args) throws NoSuchAlgorithmException {
        System.out.println(duplicateChars("Donald"));
        System.out.println(duplicateChars("orange"));
        System.out.println(getInitials("Ryan Gosling"));
        System.out.println(getInitials("Barack Obama"));
        System.out.println(differenceEvenOdd(new int[]{44, 32, 86, 19}));
        System.out.println(differenceEvenOdd(new int[]{22, 50, 16, 63, 31, 55}));
        System.out.println(equalToAvg(new int[]{1, 2, 3, 4, 5}));
        System.out.println(equalToAvg(new int[]{1, 2, 3, 4, 6}));
        System.out.println(indexMult(new int[]{1, 2, 3}));
        System.out.println(indexMult(new int[]{3, 3, -2, 408, 3, 31}));
        System.out.println(reverse("Hello World"));
        System.out.println(reverse("The quick brown fox."));
        System.out.println(Tribonacci(7));
        System.out.println(Tribonacci(11));
        System.out.println(pseudoHash(5));
        System.out.println(pseudoHash(10));
        System.out.println(botHelper("Hello, I’m under the water, please help me"));
        System.out.println(botHelper("Two pepperoni pizzas please"));
        System.out.println(isAnagramSort("listen", "silent"));
        System.out.println(isAnagramSort("eleven plus two", "twelve plus one"));
        System.out.println(isAnagramSort("hello", "world"));
    }
    public static boolean duplicateChars(String str){
        char[] chary = str.toLowerCase().toCharArray();
        boolean isDuplicate = false;
        for (int i = 0;i < str.length(); i++){
            for (int j = 0; j < str.length(); j++){
                if (i == j){
                    continue;
                }
                if (chary[i] == chary[j]){
                    isDuplicate = true;
                    break;
                }
            }
        }
        return isDuplicate;
    }


    public static String getInitials(String name) {
        int id = name.lastIndexOf(' ');
        return name.substring(0, 1) + name.substring(id + 1, id + 2);
    }
    public static int differenceEvenOdd(int[] x) {
        int sum = 0;
        int b = 0;
        int c = 0;
        for (int i = 0; i < x.length; i++) {
            sum = x[i];
            if (sum % 2 == 0){
                b = b + sum;
            }else {
                c = c + sum;
            }
        }
        x[1] = b - c;
        if ( -1 > x[1]){
            x[1] = -x[1];
        }
        return x[1];
    }
    public static boolean equalToAvg(int[] x){
        int y = 0;
        int b = 0;
        boolean Isas = false;
        for (int i = 0; i < x.length; i++){
            y = y + x[i];
        }
        if (y % x.length == 0){
            b = y / x.length;
            for (int i2 = 0; i2 < x.length; i2++){
                if(b == i2){
                    Isas = true;
                }
            }
        }else {
            return Isas;
        }

        return Isas;
    }
    public static String indexMult(int[] x){
        for (int i = 0; i < x.length; i++){
            x[i] = x[i] * i;

        }
        return Arrays.toString(x);
    }
    public static String reverse(String x){
        StringBuilder sb = new StringBuilder(x);
        sb.reverse();
        String y = sb.toString();
        return y;
    }
    public static int Tribonacci(int x){

        int[] f = new int [x];
        f[0] = 0;
        f[1] = 0;
        f[2] = 1;
        int b = f[0];

        for (int i = 3; i < x; i++) {
             b = f[i] = f[i - 3] + f[i - 2] + f[i - 1];
        }
        return b;
    }
   public static char pseudoHash(int x) {
       String dict = "abcdefghijklmnopqrstuvwxyz";
       String dig = "0123456789";
       Random xy = new Random();
       char c = 0;
       for (int i = 1; i < x; i++) {
           String sum = dict + dict.toUpperCase() + dig;
           c = sum.charAt(xy.nextInt(sum.length()));
           System.out.print(c);
       }
       return c;
   }
   public static String botHelper(String x){
        x = x.toLowerCase();
        String y = "";
        String coc =  "Calling for a staff member";
        String sos = "Keep waiting";
        boolean contrains = x.contains("help");
        if(contrains == true){
            y = coc;
        }else if (contrains == false){
            y = sos;
        }
        return y;
   }
    public static boolean isAnagramSort(String string1, String string2) {
        if (string1.length() != string2.length()) {
            return false;
        }
        char[] a1 = string1.toCharArray();
        char[] a2 = string2.toCharArray();
        Arrays.sort(a1);
        Arrays.sort(a2);
        return Arrays.equals(a1, a2);
    }
}
