package Views.UI;

import javax.swing.*;

public class AppFrame extends JFrame{
    JPanel currentPanel;

    public void SetCurrentPanel(IPanel iPanel){
        currentPanel = iPanel.GetPanel();
        currentPanel.setVisible(true);
        add(currentPanel);
        SetupFrame();
    }

    public JPanel GetCurrentPanel(){ return this.currentPanel; }

    private void SetupFrame() {
        SetupFrameLayout();
        pack();
        setLocationRelativeTo(null);
    }
    private void SetupFrameLayout() {
        var mainLayout = new GroupLayout(getContentPane());

        getContentPane().setLayout(mainLayout);
        mainLayout.setHorizontalGroup(
                mainLayout.createParallelGroup(GroupLayout.Alignment.LEADING)
                        .addComponent(currentPanel, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        mainLayout.setVerticalGroup(
                mainLayout.createParallelGroup(GroupLayout.Alignment.LEADING)
                        .addComponent(currentPanel, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
    }
    public void SetupOnTimeConfiguration() {
        setUndecorated(true);
        setVisible(true);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
    }
}
