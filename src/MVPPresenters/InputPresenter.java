package MVPPresenters;

import static MVPPresenters.FilePresenter.*;
import static MVPViews.OutputView.*;
import static MVPPresenters.DataBasePresenter.*;
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
