package Presenters;

import java.awt.*;
import java.io.File;
import java.io.IOException;

public class FilePresenter {
    public static void OpenFile(String fileName) throws IOException {
        String Path = "SQL/".concat(fileName).concat(".sql");
        Desktop myDesktop = Desktop.getDesktop();
        myDesktop.open(new File(Path));
        if (fileName.equals("ModélisationQ1")) {
            Path = "SQL/Modelisation - MCD MLD.pdf";
            myDesktop = Desktop.getDesktop();
            myDesktop.open(new File(Path));
        }

    }
}