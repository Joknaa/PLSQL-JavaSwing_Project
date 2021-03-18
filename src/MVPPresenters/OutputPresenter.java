package MVPPresenters;

import MVPViews.OutputView;
import java.sql.SQLException;
import static MVPPresenters.DataBasePresenter.*;

public class OutputPresenter {
    public static void SetUpGUI(){ OutputView.SetUpGUI(); }

    public static String Try_GetMediaDescription(String selectedValue) {
            return selectedValue;
    }

    public static void DisplayError(String error) { OutputView.DisplayError(error);}
}
