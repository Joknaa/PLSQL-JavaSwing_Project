package Presenters;

import java.awt.*;
import java.io.File;
import java.io.IOException;

public class FilePresenter {
    public static void OpenFile(String fileName) throws IOException {
        String Path = "SQL/".concat(fileName).concat(".sql");
        Desktop myDesktop = Desktop.getDesktop();
        myDesktop.open(new File(Path));
    }
}