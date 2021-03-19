package Presenters;

import Views.OutputView;

public class OutputPresenter {
    public static void SetUpGUI(){ OutputView.SetUpGUI(); }

    public static String DisplayInputDialog(String message) { return OutputView.DisplayInputDialog(message);}
    public static void DisplayError(String error) { OutputView.DisplayError(error);}
}
