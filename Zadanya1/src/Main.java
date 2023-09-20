public class Main {
    public static void main(String[] args) {
        System.out.println(convert(5));
        System.out.println(convert(3));
        System.out.println(convert(8));
        System.out.println(fitCalc(15,1));
        System.out.println(fitCalc(24,2));
        System.out.println(fitCalc(41,3));
        System.out.println(containers(3,4,2));
        System.out.println(containers(5,0,2));
        System.out.println(containers(4,1,4));
        System.out.println(triangleType(5,5,5));
        System.out.println(triangleType(5,4,5));
        System.out.println(triangleType(3,4,5));
        System.out.println(ternaryEvaluation(8,4));
        System.out.println(ternaryEvaluation(1,11));
        System.out.println(ternaryEvaluation(5,9));
        System.out.println(howManyItems(22,1.4f,2));
        System.out.println(howManyItems(45,1.8f,1.9f));
        System.out.println(howManyItems(100,2f,2));
        System.out.println(factorial(3));
        System.out.println(factorial(5));
        System.out.println(factorial(7));
        System.out.println(qcd(48,18));
        System.out.println(qcd(52,8));
        System.out.println(qcd(259,28));
        System.out.println(ticketSaler(70,1500));
        System.out.println(ticketSaler(24,950));
        System.out.println(ticketSaler(53,1250));
        System.out.println(tables(5,2));
        System.out.println(tables(31,20));
        System.out.println(tables(123,58));
    }
    public static double convert(int x) {
        double gallon = 3.785;
        double da = x * gallon;
        return da;
        }

    public static int fitCalc(int y, int z){
        return y * z;
    }
    public static int containers(int x, int y, int z){
        int we = x * 20;
        int wr = y * 50;
        int wt = z * 100;
        int wy = we + wr + wt;
        return wy;
    }
    public static String triangleType(int x, int y, int z) {
        if (x == y && y == z) {
            return "isosceles";
        } else if (x == y || x == z || y == z){
            return "equilateral";
        }
        else if (x != y && y != z){
            return "different-sided";
        }else if (x == 0 && y == 0 && z == 0){
            return "not";
        }

        return "oa";
    }
    public static int ternaryEvaluation(int a, int b){
        int kk = a > b ? a : b;
        return kk;
    }
    public static float howManyItems(int z,float w, float h){
        int pp = (int) (z/ ((w + h) * 2));
        return pp;
    }
    public static int factorial(int x){
        int bb = 1;
        for (int i = 1; i <= x; i++){
            bb = bb * i;
        }
        return bb;
    }
    public static int qcd(int x, int y){
        while (x != y) {
            if (x > y) {
                x = x - y;
            }
            else {
                y = y - x;
            }
        }
        return x;
    }
    public static int ticketSaler(int x,int y){
        int mn = (y * 28) / 100;
        int ll = y - mn;
        int vc = ll * x;
        return vc;
    }
    public static int tables(int x, int y){
        int s = 0;
        for (int i = y; i * 2 < x; i++){
            if ( x > y * 2){
                s = i;
            } else if ( x < y * 2){
                s = 0;
            }
            s++;
            s = s - y;
        }

        return s;
    }
}