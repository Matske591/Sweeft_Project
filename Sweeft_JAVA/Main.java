import java.util.Arrays;

public class Main {
    public static Boolean isPalindrome(String text) {
        StringBuilder revText = new StringBuilder();
        for (int i = text.length() - 1; i >= 0; i--) {
            revText.append(text.charAt(i));
        }
        return text.equalsIgnoreCase(revText.toString());
    }

    public static int minSplit(int amount) {
        int[] monets = new int[]{1, 5, 10, 20, 50};
        int res = 0;

        for (int i = 4; i > 0; i--) {
            if (amount >= monets[i]) {
                res += amount / monets[i];
                amount %= monets[i];
            }
        }
        return res;
    }

    public static int notContains(int[] array) {
        Arrays.sort(array);
        int min = 1;

        for (int j : array) {
            if (j == min)
                min++;
        }
        return min;
    }

    public static boolean isProperly(String sequence) {
        if (sequence.length() % 2 == 1) {
            return false;
        }

        int n = 0;
        for (int i = 0; i < sequence.length(); i++) {
            if (sequence.charAt(i) == '(')
                n++;
            if (sequence.charAt(i) == ')') {
                n--;
                if (n < 0) {
                    return false;
                }
            }
        }
        return n == 0;
    }

    public static int countVariants(int stearsCount) {
        int[] d = new int[stearsCount + 2];
        d[1] = 1;
        d[2] = 2;

        for (int k = 3; k <= stearsCount; k++)
            d[k] = d[k - 1] + d[k - 2];

        return d[stearsCount];
    }

    //  TEST THE FUNCTIONS
    public static void main(String[] args) {
        int[] arr = {-8, 2, 0, 5, -3, 6, 0, 9, 1};

        System.out.println("notContains() Function:");
        System.out.println(notContains(arr));

        System.out.println("minSplit() Function:");
        System.out.println(minSplit(80));
        System.out.println(minSplit(50));
        System.out.println(minSplit(30));
        System.out.println(minSplit(100));

        System.out.println("isPalindrome() Function:");
        System.out.println(isPalindrome("Kayak"));
        System.out.println(isPalindrome("letter"));
        System.out.println(isPalindrome("deed"));
        System.out.println(isPalindrome("deep"));

        System.out.println("isProperly() Function:");
        System.out.println(isProperly(")"));
        System.out.println(isProperly("()"));
        System.out.println(isProperly("())()"));
        System.out.println(isProperly("()()("));
        System.out.println(isProperly("()()()"));

        System.out.println("countVariants() Function:");
        System.out.println(countVariants(1));
        System.out.println(countVariants(2));
        System.out.println(countVariants(3));
        System.out.println(countVariants(7));
        System.out.println(countVariants(13));
        System.out.println(countVariants(8));
    }
}