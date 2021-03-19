package Presenters;

import static Presenters.FilePresenter.*;
import static Views.OutputView.*;
import static Presenters.DataBasePresenter.*;
import java.io.IOException;
import java.sql.SQLException;
import javax.swing.*;

public class InputPresenter {
    public static String Try_RunFile(String fileName) {
        String output = "";
        try {
            output = RunFile(fileName);
        } catch (SQLException | ClassNotFoundException | IOException e) {
            DisplayError(e.getMessage());
        }
        return output;
    }

    public static void Try_OpenFile(JList<String> listModel) {
        try {
            OpenFile(listModel.getSelectedValue());
        } catch (Exception e){
            DisplayError(e.getMessage());
        }
    }


}
