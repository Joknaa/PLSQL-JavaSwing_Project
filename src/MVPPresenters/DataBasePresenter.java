package MVPPresenters;

import MVPModels.DataBaseModel;

import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.sql.*;

import static MVPPresenters.OutputPresenter.*;

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
            DisplayError("Ops !! You can't connect to the DataBase\n");
            System.exit(1);
        }
    }
    public static void Connect() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Session = DriverManager.getConnection(url,login,password) ;
    }
    private static void SQL_TestConnectivity() throws SQLException {
        String query = "SELECT * FROM *;";
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
    public static void RunFile(String mediaName) throws SQLException, ClassNotFoundException, IOException {
        Connect();
        CallableStatement callStmt = Session.prepareCall("{CALL " + mediaName + "}");
        //callStmt.registerOutParameter();


        Desktop myDesktop = Desktop.getDesktop();
        myDesktop.open(new File(SQL_GetFilePath(mediaName)));
        Disconnect();
    }
    private static String SQL_GetFilePath(String mediaName) throws SQLException {
        String query = "SELECT location FROM media where Name = '" + mediaName + "';";
        ResultSet dataset = Session.createStatement().executeQuery(query);
        dataset.next();
        return dataset.getString(1);
    }
    //</editor-fold>
}
