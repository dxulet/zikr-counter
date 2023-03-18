import java.util.Scanner;

public class HW3 {
   // 4.1
   public static double areaPentagon(double r) {
      double s = 2 * r * Math.sin(Math.PI / 5);
      return (5 * Math.pow(s, 2)) / (4 * Math.tan(Math.PI / 5));
   }

   // 4.4
   public static double areaHexagon(double side) {
      return (6 * Math.pow(side, 2)) / (4 * Math.tan(Math.PI / 6));
   }

   // 4.5
   public static double areaRegularPolygon(int n, double sideLength) {
      return (n * Math.pow(sideLength, 2)) / (4 * Math.tan(Math.PI / n));
   }

   // 4.9
   public static int getUnicode(char ch) {
      return (int) ch;
   }

   // 4.13
   public static String isVowel(char ch) {
      if (Character.isLetter(ch)) {
         if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u' || ch == 'A' || ch == 'E' || ch == 'I'
               || ch == 'O' || ch == 'U') {
            return "a vowel";
         } else {
            return "a consonant";
         }
      } else {
         return "an invalid input";
      }
   }

   // 4.14
   public static int convertLetterGradeToNumeric(String letterGrade) {
      switch (letterGrade.toUpperCase()) {
         case "A":
            return 4;
         case "B":
            return 3;
         case "C":
            return 2;
         case "D":
            return 1;
         case "F":
            return 0;
         default:
            throw new IllegalArgumentException(letterGrade + " is an invalid grade");
      }
   }

   // 4.18
   public static void studentMajorAndStatus() {
      Scanner input = new Scanner(System.in);
      System.out.print("Enter two characters: ");
      String major = input.next();
      char majorChar = major.charAt(0);
      char statusChar = major.charAt(1);
      String majorString = "";
      String statusString = "";

      switch (majorChar) {
         case 'M':
            majorString = "Mathematics";
            break;
         case 'C':
            majorString = "Computer Science";
            break;
         case 'I':
            majorString = "Information Technology";
            break;
         default:
            System.out.println("Invalid input");
            return;
      }
      switch (statusChar) {
         case '1':
            statusString = "Freshman";
            break;
         case '2':
            statusString = "Sophomore";
            break;
         case '3':
            statusString = "Junior";
            break;
         case '4':
            statusString = "Senior";
            break;
         default:
            System.out.println("Invalid input");
            return;
      }
      System.out.println(majorString + " " + statusString);
   }

   // 4.20
   public static void processString() {
      Scanner input = new Scanner(System.in);
      System.out.print("Enter a string: ");
      String str = input.nextLine();
      System.out.println("The length of the string is " + str.length());
      System.out.println("The first character of the string is " + str.charAt(0));
   }

   // 4.22
   public static void checkSubstring() {
      Scanner input = new Scanner(System.in);
      System.out.print("Enter string s1: ");
      String s1 = input.nextLine();
      System.out.print("Enter string s2: ");
      String s2 = input.nextLine();
      System.out.println(s2 + (s1.contains(s2) ? " is " : " is not ") + "a substring of " + s1);
   }

   // 4.24
   public static void orderThreeCities() {
      Scanner input = new Scanner(System.in);
      System.out.print("Enter the first city: ");
      String city1 = input.nextLine();
      System.out.print("Enter the second city: ");
      String city2 = input.nextLine();
      System.out.print("Enter the third city: ");
      String city3 = input.nextLine();

      if (city1.compareTo(city2) > 0) {
         String temp = city1;
         city1 = city2;
         city2 = temp;
      }
      if (city2.compareTo(city3) > 0) {
         String temp = city2;
         city2 = city3;
         city3 = temp;
      }
      if (city1.compareTo(city2) > 0) {
         String temp = city1;
         city1 = city2;
         city2 = temp;
      }
      System.out.println("The three cities in alphabetical order are " + city1 + " " + city2 + " " + city3);
   }

   public static void main(String[] args) {
      Scanner input = new Scanner(System.in);

      // 4.1
      System.out.print("Enter the length from the center to a vertex: ");
      double side = input.nextDouble();
      System.out.println("The area of the pentagon is " + areaPentagon(side));

      // 4.4
      System.out.print("Enter the side: ");
      side = input.nextDouble();
      System.out.println("The area of the hexagon is " + areaHexagon(side));

      // 4.5
      System.out.print("Enter the number of sides: ");
      int n = input.nextInt();
      System.out.print("Enter the side of polygon: ");
      side = input.nextDouble();
      System.out.println("The area of the polygon is " + areaRegularPolygon(n, side));

      // 4.9
      System.out.print("Enter a character: ");
      char ch = input.next().charAt(0);
      System.out.println("The Unicode for the character " + ch + " is " + getUnicode(ch));

      // 4.13
      System.out.print("Enter a character: ");
      ch = input.next().charAt(0);
      System.out.println(ch + " is " + isVowel(ch));

      // 4.14
      System.out.print("Enter a letter grade: ");
      String letterGrade = input.next();
      try {
         int numericGrade = convertLetterGradeToNumeric(letterGrade);
         System.out.println("The numeric value for grade " + letterGrade + " is " + numericGrade);
     } catch (IllegalArgumentException ex) {
         System.out.println(ex.getMessage());
     }

      // 4.18
      studentMajorAndStatus();

      // 4.20
      processString();

      // 4.22
      checkSubstring();

      // 4.24
      orderThreeCities();

      input.close();
   }
}
