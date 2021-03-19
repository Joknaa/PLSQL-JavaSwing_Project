package Presenters;

import Models.DataBaseModel;
import Models.FILES;
import oracle.jdbc.OracleTypes;
import oracle.jdbc.internal.OracleCallableStatement;
import java.io.IOException;
import java.sql.*;

import static Presenters.OutputPresenter.*;
import static Presenters.OutputPresenter.DisplayInputDialog;

public class DataBasePresenter {
    private static final String url = DataBaseModel.GetUrl();
    private static final String login = DataBaseModel.GetLogin();
    private static final String password = DataBaseModel.GetPassword();
    private static Connection Session = null;

    //<editor-fold desc="Setting Up Connection">
    public static void SetupDataBaseConnection(){
        try {
            Connect();
            SQL_TestConnectivity();
            Disconnect();
        } catch (SQLException | ClassNotFoundException e) {
            DisplayError(e.getMessage());
            //DisplayError("Ops !! You can't connect to the DataBase\n");
            System.exit(1);
        }
    }
    public static void Connect() throws ClassNotFoundException, SQLException {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Session = DriverManager.getConnection(url,login,password) ;
    }
    private static void SQL_TestConnectivity() throws SQLException {
        String query = "SELECT * FROM COMMAND";
        Session.createStatement().executeQuery(query);
    }
    public static void Disconnect() throws SQLException {
        if (Session != null){
            Session.close();
            Session = null;
        }
    }
    //</editor-fold>

    //<editor-fold desc="Add/Edit/Delete Media">
    public static String RunFile(String fileName) throws SQLException, ClassNotFoundException, IOException {
        Connect();
        String output = "";
        switch (FILES.valueOf(fileName)) {
            case ProcéduresQ1 -> output = RunProcedureQ1();
            case ProcéduresQ2 -> output = RunProcedureQ2();
            case ProcéduresQ3 -> output = RunProcedureQ3();

            case FonctionsQ1 -> output = RunFonctionsQ1();
            case FonctionsQ2 -> output = RunFonctionsQ2();
            case FonctionsQ3 -> output = RunFonctionsQ3();
            case FonctionsQ4 -> output = RunFonctionsQ4();
            case FonctionsQ5 -> output = RunFonctionsQ5();
            case FonctionsQ6 -> output = RunFonctionsQ6();
            case FonctionsQ7 -> output = RunFonctionsQ7();
        }
        Disconnect();
        return output;
    }

    private static String RunProcedureQ1() throws SQLException {
        String output = ("The products ordered by Unit Price: \n");

        CallableStatement callStmt = Session.prepareCall("{call triparPU(?)}");
        callStmt.registerOutParameter(1, OracleTypes.CURSOR);

        callStmt.execute();
        ResultSet rs = ((OracleCallableStatement)callStmt).getCursor(1);
        while (rs.next()) {
            output = output.concat("  Product Ref: " + rs.getString(1) + ", Product UP: " + rs.getString(5) + "\n");
        }
        return output;
    }
    private static String RunProcedureQ2() throws SQLException {
        String commandID = DisplayInputDialog("Enter the Order ID: ");
        String commandDate = DisplayInputDialog("Enter the Order Date (YYYY-MM-DD): ");
        String clientID = DisplayInputDialog("Enter the Client ID: ");
        String productID = DisplayInputDialog("Enter the Product ID: ");
        String quantity = DisplayInputDialog("Enter the Quantity: ");
        String deliveryDate = DisplayInputDialog("Enter the Delivery Date (YYYY-MM-DD): ");

        CallableStatement callStmt = Session.prepareCall("{call lance_comm(?,?,?,?,?,?)}");
        callStmt.setInt(1, Integer.parseInt(commandID));
        callStmt.setDate(2, Date.valueOf(commandDate));
        callStmt.setInt(3, Integer.parseInt(clientID));
        callStmt.setString(4, productID);
        callStmt.setInt(5, Integer.parseInt(quantity));
        callStmt.setDate(6, Date.valueOf(deliveryDate));

        callStmt.execute();
        return "Orded Added ..";
    }
    private static String RunProcedureQ3() throws SQLException {
        String commandID = DisplayInputDialog("Enter the Order ID: ");
        String commandDate = DisplayInputDialog("Enter the Order Date (YYYY-MM-DD): ");
        String clientID = DisplayInputDialog("Enter the Client ID: ");
        String productID = DisplayInputDialog("Enter the Product ID: ");
        String quantity = DisplayInputDialog("Enter the Quantity: ");
        String deliveryDate = DisplayInputDialog("Enter the Delivery Date (YYYY-MM-DD): ");
        String discount = DisplayInputDialog("Enter the discount (0 .. 100): ");

        CallableStatement callStmt = Session.prepareCall("{call remise(?,?,?,?,?,?,?)}");
        callStmt.setInt(1, Integer.parseInt(commandID));
        callStmt.setDate(2, Date.valueOf(commandDate));
        callStmt.setInt(3, Integer.parseInt(clientID));
        callStmt.setString(4, productID);
        callStmt.setInt(5, Integer.parseInt(quantity));
        callStmt.setDate(6, Date.valueOf(deliveryDate));
        callStmt.setInt(7, Integer.parseInt(discount));

        callStmt.execute();
        return "Orded Added ..";
    }

    private static String RunFonctionsQ1() throws SQLException {
        String question = "Ecrire une fonction permettant d’afficher la somme des commandes passées par un client données.\n";
        String clientID = DisplayInputDialog(question.concat("Enter the Client ID"));
        String clientCommands = String.format("Client %s has the following orders: \n", clientID);

        CallableStatement callStmt = Session.prepareCall("{? = call f_GetOrdersList(?)}");
        callStmt.registerOutParameter(1, OracleTypes.CURSOR);
        callStmt.setInt(2, Integer.parseInt(clientID));

        callStmt.execute();
        ResultSet rs = ((OracleCallableStatement)callStmt).getCursor(1);
        while (rs.next()) {
            clientCommands = clientCommands.concat(rs.getString(1)).concat(", ");
        }
        return clientCommands;
    }
    private static String RunFonctionsQ2() throws SQLException {
        String question = "Ecrire deux fonction MaxClient et MinClient permettant d’afficher le client qui a fait le Max et Min d’achat\n";
        String output = "";
        String minClient = question.concat("Min Client: ");
        String maxClient = ("Max Client: ");

        CallableStatement MinClientStmt = Session.prepareCall("{? = call f_GetMinClient()}");
        MinClientStmt.registerOutParameter(1, OracleTypes.NUMBER);
        MinClientStmt.execute();
        String MinClientID = String.valueOf(MinClientStmt.getInt(1));

        CallableStatement MaxClientStmt = Session.prepareCall("{? = call f_GetMaxClient()}");
        MaxClientStmt.registerOutParameter(1, OracleTypes.NUMBER);
        MaxClientStmt.execute();
        String MaxClientID = String.valueOf(MaxClientStmt.getInt(1));

        return minClient.concat(MinClientID).concat("\n").concat(maxClient).concat(MaxClientID);
    }
    private static String RunFonctionsQ3() throws SQLException {
        String question = "Ecrire une fonction pour convertir le montant d’une commande du MAD en Euro ou Dollar selon le choix de l’utilisateur.\n";
        String CommandID = (DisplayInputDialog(question.concat("Enter the Command ID")));
        String toEuro = (String.format("The value of the command %s in Euro is: ",CommandID));
        String toDollar = String.format("\nThe value of the command %s in Dollar is: ", CommandID);

        CallableStatement Mad2Euro = Session.prepareCall("{? = call f_MAD2EURO(?)}");
        Mad2Euro.registerOutParameter(1, OracleTypes.FLOAT);
        Mad2Euro.setInt(2, Integer.parseInt(CommandID));
        Mad2Euro.execute();
        String EuroValue = String.valueOf(Mad2Euro.getFloat(1));

        CallableStatement Mad2Dollar = Session.prepareCall("{? = call f_MAD2DOLLAR(?)}");
        Mad2Dollar.registerOutParameter(1, OracleTypes.FLOAT);
        Mad2Dollar.setInt(2, Integer.parseInt(CommandID));
        Mad2Dollar.execute();
        String DollarValue = String.valueOf(Mad2Dollar.getFloat(1));

        return toEuro.concat(EuroValue).concat(toDollar).concat(DollarValue);
    }
    private static String RunFonctionsQ4() throws SQLException {
        String question = "Ecrire une fonction qui prend l’ID d’une catégorie et retourne le nombre d’article existant\n";
        String categoryID = (DisplayInputDialog(question.concat("Enter the Category ID")));
        String output = (String.format("The number of products in the category %s is: ", categoryID));

        CallableStatement articleCountstmt = Session.prepareCall("{? = call f_CountArticles(?)}");
        articleCountstmt.registerOutParameter(1, OracleTypes.NUMBER);
        articleCountstmt.setInt(2, Integer.parseInt(categoryID));
        articleCountstmt.execute();
        String articleCount = String.valueOf(articleCountstmt.getInt(1));

        return output.concat(articleCount);
    }
    private static String RunFonctionsQ5() throws SQLException {
        String question = "Ecrire une fonction qui prend l’ID d’un client et retourne le nombre de commande qu’il a effectue\n";
        String clientID = (DisplayInputDialog(question.concat("Enter the Client ID")));
        String output = (String.format("Number of orders for the client %s is: ", clientID));

        CallableStatement ordersCountStmt = Session.prepareCall("{? = call f_CountOrders(?)}");
        ordersCountStmt.registerOutParameter(1, OracleTypes.NUMBER);
        ordersCountStmt.setInt(2, Integer.parseInt(clientID));
        ordersCountStmt.execute();
        String ordersCount = String.valueOf(ordersCountStmt.getInt(1));

        return output.concat(ordersCount);
    }
    private static String RunFonctionsQ6() throws SQLException {
        String question = "Ecrire une fonction permettant de calculer le CA d’un produit donné\n";
        String productID = DisplayInputDialog(question.concat("Enter the Product ID"));
        String output = (String.format("The turnover of the product %s is: ", productID));

        CallableStatement turnoverStmt = Session.prepareCall("{? = call f_CalculateTurnover(?)}");
        turnoverStmt.registerOutParameter(1, OracleTypes.FLOAT);
        turnoverStmt.setString(2, productID);
        turnoverStmt.execute();
        String turnover = String.valueOf(turnoverStmt.getInt(1));

        return output.concat(turnover);
    }
    private static String RunFonctionsQ7() throws SQLException {
        String question = "Ecrire une fonction permettant de calculer le CA annuelle de l’entreprise.\n";
        String year = (DisplayInputDialog(question.concat("Enter the Year: ")));
        String output = String.format("The turnover of the year %s is: ", year);
        String startDate = year.concat("-01-01");
        String endDate = year.concat("-12-31");

        CallableStatement turnoverStmt = Session.prepareCall("{? = call f_CalculateAnnualTurnover(?,?)}");
        turnoverStmt.registerOutParameter(1, OracleTypes.FLOAT);
        turnoverStmt.setString(2, startDate);
        turnoverStmt.setString(3, endDate);
        turnoverStmt.execute();
        String turnover = String.valueOf(turnoverStmt.getFloat(1));

        return output.concat(turnover);
    }


    //</editor-fold>
}
