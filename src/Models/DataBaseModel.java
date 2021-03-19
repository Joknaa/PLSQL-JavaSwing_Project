package Models;

public class DataBaseModel {
    private static String url = "jdbc:oracle:thin:@//localhost:1521/XEPDB1";
    private static String login = "SYSTEM";
    private static String password = "oknaa";

    public static void SetUrl(String URL){ url = URL;}
    public static void SetLogin(String LOGIN){ login = LOGIN;}
    public static void SetPassword(String PASSWORD){ password = PASSWORD;}

    public static String GetUrl(){ return url;}
    public static String GetLogin(){ return login;}
    public static String GetPassword(){ return password;}
}
