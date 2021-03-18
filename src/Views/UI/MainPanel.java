package Views.UI;

import javax.swing.plaf.basic.BasicScrollBarUI;
import javax.swing.event.*;
import javax.swing.*;
import static Views.OutputView.*;
import static javax.swing.GroupLayout.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainPanel extends JPanel implements IPanel, ActionListener {
    //<editor-fold desc="Variables Declarations">">
    private final JPanel logoPanel = new JPanel();
    private final JPanel headerPanel = new JPanel();
    private final JPanel descriptionPanel = new JPanel();
    private final JPanel listPanel = new JPanel();
    private final JPanel buttonsPanel = new JPanel();
    private final JList<String> list = new JList<>();
    private final JLabel logoLabel = new JLabel(new ImageIcon("Resources/library_100px.png"));
    private final JTextArea greetingTextArea = new JTextArea();
    private final JScrollPane scrollPanList = new JScrollPane();
    private final JTextArea OutputTextArea = new JTextArea();
    private final JTextArea logoTextArea = new JTextArea();
    private final JButton closeButton = new JButton("X");
    private final JButton openButton = new JButton("OPEN");
    private final JButton deleteButton = new JButton("Delete");
    private final JButton runButton = new JButton("Run");
    private final DefaultListModel<String> defaultListModel = new DefaultListModel<>();
    //</editor-fold>

    public MainPanel(){
        SetupLogoPanel();
        SetupHeaderPanel();
        SetupDescriptionPanel();
        SetupListPanel();
        SetupButtonsPanel();
        SetupMainPanel();
    }

    private void SetupLogoPanel() {
        SetupLogoTextArea();
        SetupLogoPanelLayout();
        logoPanel.setBackground(PICKLED_BLUEWOOD);
        logoPanel.setPreferredSize(new Dimension(450, 500));
    }
    private void SetupLogoTextArea() {
        logoTextArea.setEditable(false);
        logoTextArea.setBackground(PICKLED_BLUEWOOD);
        logoTextArea.setColumns(5);
        logoTextArea.setFont(new Font("Source Code Pro", Font.BOLD, 30));
        logoTextArea.setForeground(BLUE_BAYOUX);
        logoTextArea.setRows(1);
        logoTextArea.setTabSize(1);
        logoTextArea.setText("Project PLSQL");
        logoTextArea.setAutoscrolls(false);
        logoTextArea.setFocusable(false);
    }
    private void SetupLogoPanelLayout() {
        GroupLayout LogoPanelLayout = new GroupLayout(logoPanel);
        logoPanel.setLayout(LogoPanelLayout);
        LogoPanelLayout.setHorizontalGroup(
                LogoPanelLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(LogoPanelLayout.createSequentialGroup()
                                .addComponent(logoLabel)
                                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(logoTextArea, DEFAULT_SIZE, 344, Short.MAX_VALUE)
                        )
        );
        LogoPanelLayout.setVerticalGroup(
                LogoPanelLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(LogoPanelLayout.createSequentialGroup()
                                .addGroup(LogoPanelLayout.createParallelGroup(Alignment.TRAILING)
                                        .addGroup(LogoPanelLayout.createSequentialGroup()
                                                .addContainerGap()
                                                .addComponent(logoTextArea, PREFERRED_SIZE, DEFAULT_SIZE, PREFERRED_SIZE)
                                                .addGap(41, 41, 41))
                                        .addComponent(logoLabel))
                                .addGap(0, 0, Short.MAX_VALUE)
                        )
        );
    }

    private void SetupHeaderPanel() {
        headerPanel.setBackground(BLUE_BAYOUX);
        SetupGreetingLabel();
        SetupHeaderPanelLayout();
    }
    private void SetupGreetingLabel() {
        greetingTextArea.setFont(new Font("Source Code Pro", Font.PLAIN, 20));
        greetingTextArea.setBackground(BLUE_BAYOUX);
        greetingTextArea.setForeground(PICKLED_BLUEWOOD);
        greetingTextArea.setAutoscrolls(false);
        greetingTextArea.setFocusable(false);
        greetingTextArea.setText("""
                Made by:
                    Niama Mouradi
                    Mohamed Hamouyi
                    Mohammad Laadidaoui
                """);
    }
    private void SetupHeaderPanelLayout() {
        GroupLayout headerPanelLayout = new GroupLayout(headerPanel);
        headerPanel.setLayout(headerPanelLayout);
        headerPanelLayout.setHorizontalGroup(
                headerPanelLayout.createParallelGroup(Alignment.LEADING)
                        .addComponent(greetingTextArea, Alignment.TRAILING, DEFAULT_SIZE, DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(Alignment.TRAILING, headerPanelLayout.createSequentialGroup()
                                .addContainerGap(151, Short.MAX_VALUE)
                                .addGap(247, 247, 247))
        );
        headerPanelLayout.setVerticalGroup(
                headerPanelLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(headerPanelLayout.createSequentialGroup()
                                .addComponent(greetingTextArea)
                                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
                                .addContainerGap(DEFAULT_SIZE, Short.MAX_VALUE))
        );
    }

    private void SetupDescriptionPanel() {
        SetupDescriptionTable();
        SetupDescriptionPanelLayout();
        descriptionPanel.setBackground(BLUE_BAYOUX);
        descriptionPanel.setPreferredSize(new Dimension(450, 500));
    }
    private void SetupDescriptionTable() {
        OutputTextArea.setFont(new Font("Source Code Pro", Font.PLAIN, 15));
        OutputTextArea.setForeground(BLUE_HAZE);
        OutputTextArea.setBackground(Color.black);
        //OutputTextArea.setBackground(BLUE_BAYOUX);
        OutputTextArea.setFocusable(false);
        OutputTextArea.setEnabled(false);
        OutputTextArea.setPreferredSize(new Dimension(400,400));
        OutputTextArea.setAutoscrolls(false);
        OutputTextArea.setLineWrap(true);
    }
    private void SetupDescriptionPanelLayout() {
        GroupLayout descriptionPanelLayout = new GroupLayout(descriptionPanel);
        descriptionPanel.setLayout(descriptionPanelLayout);
        descriptionPanelLayout.setHorizontalGroup(
                descriptionPanelLayout.createParallelGroup(Alignment.LEADING)
                        .addGap(10, 10, Short.MAX_VALUE)
                        .addGroup(descriptionPanelLayout.createParallelGroup(Alignment.CENTER)
                                .addGroup(descriptionPanelLayout.createSequentialGroup()
                                        .addContainerGap()
                                        .addComponent(OutputTextArea, 400, 400, 400)
                                .addContainerGap())
                        )
        );
        descriptionPanelLayout.setVerticalGroup(
                descriptionPanelLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(descriptionPanelLayout.createParallelGroup(Alignment.LEADING)
                                .addGroup(descriptionPanelLayout.createSequentialGroup()
                                        .addComponent(OutputTextArea, 200, 200, 200)
                                        .addContainerGap(28, Short.MAX_VALUE)
                                )
                        )
        );
    }

    private void SetupListPanel() {
        SetupScrollPanList();
        SetupListPanelLayout();
        listPanel.setBackground(PICKLED_BLUEWOOD);
    }
    private void SetupScrollPanList() {
        SetupMediaList();
        scrollPanList.setBackground(PICKLED_BLUEWOOD);
        scrollPanList.setBorder(null);
        scrollPanList.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
        scrollPanList.setEnabled(false);
        scrollPanList.setFocusable(false);
        scrollPanList.setRequestFocusEnabled(false);
        scrollPanList.getVerticalScrollBar().setBackground(BLUE_BAYOUX);
        scrollPanList.getVerticalScrollBar().setUI(new BasicScrollBarUI() {
            @Override
            protected void configureScrollBarColors() {
                this.thumbColor = BLUE_HAZE;
            }
        });
        scrollPanList.setViewportView(list);
    }
    private void SetupMediaList() {
        CreateMediaList();
        list.setFont(new Font("Source Code Pro", Font.PLAIN, 18));
        list.setSelectionBackground(BLUE_HAZE);
        list.setSelectionForeground(PICKLED_BLUEWOOD);
        list.setBackground(PICKLED_BLUEWOOD);
        list.setForeground(BLUE_HAZE);
        list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        list.setCursor(new Cursor(Cursor.HAND_CURSOR));
        list.setFixedCellHeight(40);
        list.setFixedCellWidth(40);
        list.setAutoscrolls(false);
        list.addListSelectionListener(this::ListSelectionChanged);
    }
    public void CreateMediaList() {
        String[] listData = new String[]{
                "ModélisationQ1",
                "ModélisationQ2",
                "ModélisationQ3",
                "CurseursQ1",
                "CurseursQ2",
                "ProcéduresQ1",
                "ProcéduresQ2",
                "ProcéduresQ3",
                "ProcéduresQ4",
                "FonctionsQ1",
                "FonctionsQ2",
                "FonctionsQ3",
                "FonctionsQ4",
                "FonctionsQ5",
                "FonctionsQ6",
                "FonctionsQ7",
                "TriggersQ1",
                "TriggersQ2",
                "TriggersQ3",
        };
        list.setModel(defaultListModel);
        for (String element : listData) { defaultListModel.addElement(element); }
    }
    private void SetupListPanelLayout() {
        GroupLayout ListPanelLayout = new GroupLayout(listPanel);
        listPanel.setLayout(ListPanelLayout);
        ListPanelLayout.setHorizontalGroup(
                ListPanelLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(Alignment.TRAILING, ListPanelLayout.createSequentialGroup()
                                .addContainerGap(DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(scrollPanList, PREFERRED_SIZE, 340, PREFERRED_SIZE)
                                .addGap(60, 60, 60))
        );
        ListPanelLayout.setVerticalGroup(
                ListPanelLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(Alignment.TRAILING, ListPanelLayout.createSequentialGroup()
                                .addContainerGap(49, Short.MAX_VALUE)
                                .addComponent(scrollPanList, PREFERRED_SIZE, 297, PREFERRED_SIZE)
                                .addGap(54, 54, 54))
        );
    }

    private void SetupButtonsPanel() {
        buttonsPanel.setBackground(BLUE_BAYOUX);
        SetupSubmitButton(openButton, this, false, "Open the file containing the solution");
        SetupSubmitButton(runButton, this, false, "Run the file containing the solution");
        SetupButtonsPanelLayout();
    }
    private void SetupButtonsPanelLayout() {
        GroupLayout buttonsPanelLayout = new GroupLayout(buttonsPanel);
        buttonsPanel.setLayout(buttonsPanelLayout);
        buttonsPanelLayout.setHorizontalGroup( buttonsPanelLayout.createParallelGroup(Alignment.LEADING)
                .addGroup(Alignment.LEADING, buttonsPanelLayout.createSequentialGroup()
                        .addGap(100, 100, 100)
                        .addComponent(openButton, PREFERRED_SIZE, DEFAULT_SIZE, PREFERRED_SIZE)
                        .addGap(20, 20, 20)
                        .addComponent(runButton, PREFERRED_SIZE, DEFAULT_SIZE, PREFERRED_SIZE)
                        .addGap(100, 100, 100)
                )
        );
        buttonsPanelLayout.setVerticalGroup( buttonsPanelLayout.createParallelGroup(Alignment.CENTER)
                .addGap(50, 50, 50)
                .addComponent(runButton, PREFERRED_SIZE, 23, PREFERRED_SIZE)
                .addComponent(openButton, PREFERRED_SIZE, 23, PREFERRED_SIZE)
        );
    }

    private void SetupMainPanel() {
        SetupCloseButton(closeButton);
        SetupMainPanelLayout();
        setBackground(BLUE_BAYOUX);
        setPreferredSize(new Dimension(900, 500));
    }
    private void SetupMainPanelLayout() {
        GroupLayout MainPanelLayout = new GroupLayout(this);
        this.setLayout(MainPanelLayout);
        MainPanelLayout.setHorizontalGroup(
                MainPanelLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(MainPanelLayout.createSequentialGroup()
                                .addGroup(MainPanelLayout.createParallelGroup(Alignment.LEADING, false)
                                        .addComponent(logoPanel, DEFAULT_SIZE, DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addComponent(listPanel, DEFAULT_SIZE, DEFAULT_SIZE, Short.MAX_VALUE))
                                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(MainPanelLayout.createParallelGroup(Alignment.LEADING)
                                        .addGroup(MainPanelLayout.createSequentialGroup()
                                                .addGroup(MainPanelLayout.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(descriptionPanel, DEFAULT_SIZE, 433, Short.MAX_VALUE)
                                                        .addGroup(MainPanelLayout.createSequentialGroup()
                                                                .addGap(0, 0, Short.MAX_VALUE)
                                                                .addComponent(buttonsPanel, PREFERRED_SIZE, DEFAULT_SIZE, PREFERRED_SIZE)))
                                                .addGap(8, 8, 8))
                                        .addGroup(MainPanelLayout.createSequentialGroup()
                                                .addComponent(headerPanel, PREFERRED_SIZE, DEFAULT_SIZE, PREFERRED_SIZE)
                                                .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
                                                .addComponent(closeButton, PREFERRED_SIZE, 21, PREFERRED_SIZE)
                                                .addGap(0, 7, Short.MAX_VALUE))))
        );
        MainPanelLayout.setVerticalGroup(
                MainPanelLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(MainPanelLayout.createSequentialGroup()
                                .addGap(8, 8, 8)
                                .addGroup(MainPanelLayout.createParallelGroup(Alignment.LEADING)
                                        .addComponent(headerPanel, PREFERRED_SIZE, DEFAULT_SIZE, PREFERRED_SIZE)
                                        .addComponent(closeButton, PREFERRED_SIZE, 23, PREFERRED_SIZE))
                                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(descriptionPanel, PREFERRED_SIZE, 196, PREFERRED_SIZE)
                                .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(buttonsPanel, PREFERRED_SIZE, 57, PREFERRED_SIZE)
                                .addGap(84, 84, 84))
                        .addGroup(Alignment.TRAILING, MainPanelLayout.createSequentialGroup()
                                .addComponent(logoPanel, PREFERRED_SIZE, 100, PREFERRED_SIZE)
                                .addGap(0, 0, Short.MAX_VALUE)
                                .addComponent(listPanel, PREFERRED_SIZE, DEFAULT_SIZE, PREFERRED_SIZE)
                        )
        );
    }

    private void ListSelectionChanged(ListSelectionEvent evt) {
        String selectedValue = list.getSelectedValue();
        if (!evt.getValueIsAdjusting()) {
            openButton.setEnabled(true);
            runButton.setEnabled(list.getSelectedIndex() > 2);
            OnListSelection_UpdateDescription(selectedValue, OutputTextArea);
        }
    }

    @Override
    public JPanel GetPanel() { return this; }
    @Override
    public void Activate(){ this.setVisible(true);}
    @Override
    public void Deactivate(){ this.setVisible(false);}
    @Override
    public void actionPerformed(ActionEvent event) {
        if (event.getSource().equals(runButton))
            OnClick_RunFile(list, defaultListModel, deleteButton);
        else if (event.getSource().equals(openButton))
            OnClick_OpenFile(list);
    }
}