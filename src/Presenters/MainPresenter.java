package Presenters;

import static Presenters.DataBasePresenter.SetupDataBaseConnection;
import static Presenters.OutputPresenter.*;

public class MainPresenter {
    public static void start() {
        SetupDataBaseConnection();
        SetUpGUI();
    }
}
