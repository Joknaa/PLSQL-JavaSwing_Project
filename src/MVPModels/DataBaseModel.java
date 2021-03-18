package MVPModels;

public class DataBaseModel {
    private static String url = "jdbc:mysql://localhost:3306/myDatabase?autoReconnect=true&useSSL=false";
    private static String login = "root";
    private static String password = "";

    public static void SetUrl(String URL){ url = URL;}
    public static void SetLogin(String LOGIN){ login = LOGIN;}
    public static void SetPassword(String PASSWORD){ password = PASSWORD;}

    public static String GetUrl(){ return url;}
    public static String GetLogin(){ return login;}
    public static String GetPassword(){ return password;}
}
