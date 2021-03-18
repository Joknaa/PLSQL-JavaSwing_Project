package Views;

import static Presenters.OutputPresenter.*;
import static javax.swing.JOptionPane.*;
import static Presenters.InputPresenter.*;

import Views.UI.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class OutputView {
    private static final AppFrame appFrame = new AppFrame();
    public static final Color PICKLED_BLUEWOOD = new Color(52, 66, 91);
    public static final Color BLUE_BAYOUX = new Color(76, 96, 133);
    public static final Color BLUE_HAZE = new Color(190, 200, 218);
    public static final IPanel mainPanel = new MainPanel();

    public static void SetUpGUI() {
        appFrame.SetupOnTimeConfiguration();
        appFrame.SetCurrentPanel(new MainPanel());
    }

    //<editor-fold desc="On-Events Actions">
    public static void OnClick_SwapPanels(IPanel gotoPanel){
        appFrame.GetCurrentPanel().setVisible(false);
        appFrame.SetCurrentPanel(gotoPanel);
    }
    public static void OnListSelection_UpdateDescription(String selectedValue, JTextArea descriptionTable) {
        String ItemDescription = Try_GetMediaDescription(selectedValue);
        descriptionTable.setText(ItemDescription);
    }
    public static void OnClick_RunFile(JList<String> list, DefaultListModel<String> listModel, JButton deleteButton){
        Try_RunFile(list.getSelectedValue());
    }
    public static void OnClick_OpenFile(JList<String> list){
        Try_OpenFile(list);
    }
    //</editor-fold>

    //<editor-fold desc="Setup Comment Components">
    public static void SetupCloseButton(JButton closeButton){
        closeButton.setBackground(BLUE_BAYOUX);
        closeButton.setFont(new java.awt.Font("Source Code Pro", Font.PLAIN, 24));
        closeButton.setForeground(PICKLED_BLUEWOOD);
        closeButton.setText("X");
        closeButton.setToolTipText("Close");
        closeButton.setBorder(null);
        closeButton.setContentAreaFilled(false);
        closeButton.setFocusPainted(false);
        closeButton.setFocusable(false);
        closeButton.setMaximumSize(new java.awt.Dimension(100, 38));
        closeButton.setMinimumSize(new java.awt.Dimension(100, 38));
        closeButton.setPreferredSize(new java.awt.Dimension(100, 38));
        closeButton.setFont(new Font("Segoe UI", Font.PLAIN, 24));
        closeButton.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) { System.exit(0); }
        });
    }
    public static void SetupSubmitButton(JButton submitButton, ActionListener actionListener, boolean isEnabled, String toolTip) {
        //todo: add some feed back on clicking the buttons
        submitButton.setBorder(BorderFactory.createLineBorder(BLUE_HAZE));
        submitButton.setPreferredSize(new Dimension(100, 38));
        submitButton.setMaximumSize(new Dimension(100, 38));
        submitButton.setMinimumSize(new Dimension(100, 38));
        submitButton.setBackground(BLUE_BAYOUX);
        submitButton.setForeground(BLUE_HAZE);
        submitButton.setToolTipText(toolTip);
        submitButton.setEnabled(isEnabled);
        submitButton.setContentAreaFilled(false);
        submitButton.setFocusPainted(false);
        submitButton.setFocusable(false);
        submitButton.setOpaque(false);
        submitButton.addActionListener(actionListener);
    }
    //</editor-fold>

    public static void DisplayError(String error) {
        showMessageDialog(null, error, "Error", ERROR_MESSAGE);
    }
}