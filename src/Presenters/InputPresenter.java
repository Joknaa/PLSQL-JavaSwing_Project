package Presenters;

import static Presenters.FilePresenter.*;
import static Views.OutputView.*;
import static Presenters.DataBasePresenter.*;
import java.io.IOException;
import java.sql.SQLException;
import javax.swing.*;

public class InputPresenter {
    public static void Try_RunFile(String mediaName) {
        try {
            RunFile(mediaName);
        } catch (SQLException | ClassNotFoundException | IOException e) {
            DisplayError(e.getMessage());
        }
    }

    public static void Try_OpenFile(JList<String> listModel) {
        try {
            OpenFile(listModel.getSelectedValue());
        } catch (Exception e){
            DisplayError(e.getMessage());
        }
    }


}
