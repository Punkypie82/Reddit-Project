import java.io.*;
import java.util.HashMap;

public class FileController {
    static FileController filec;
    private final HashMap<String, Controller> fileMap= new HashMap<String, Controller>();

    static public FileController getFileController() {
        if(filec==null){
            filec= new FileController();
        }
        return filec;
    }
    void addFileController(String s, Controller controller){
        fileMap.put(s,controller);
    }

         Controller callController (String s){
            return  fileMap.get(s);
        }


}

class Controller{
    private File file;
    private FileWriter filewriter;
    private RandomAccessFile randAcsFile;

    public Controller(String s){
        file = new File(s);
        try{
            randAcsFile= new RandomAccessFile(file,"rw");
            String read=rFile();
            filewriter= new FileWriter(file);
            //Be carefull about that
            wFile(read,true);


        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    String rFile(){
        StringBuilder str=new StringBuilder();
        String i;
        try{
            while((i= randAcsFile.readLine()) != null){
                str.append(i).append("\n");
            }
            randAcsFile.seek(0);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return str.toString();
    }

    void wFile(String s, boolean flag){
        try{
            if(flag==true){
                filewriter= new FileWriter(file);

            }
            filewriter.write(s);
            filewriter.flush();


        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    String getFilter(String line){
        String[] reader=this.rFile().split("\n");
        for(String s : reader){
            if(s.startsWith(line)){
                return s;
            }
        }
        return " ";
    }

    void removeLineFile(String line) throws IOException {
        File inFile = new File("myFile.txt");
        File temp = new File("myTempFile.txt");

        BufferedReader reader = new BufferedReader(new FileReader(inFile));
        BufferedWriter writer = new BufferedWriter(new FileWriter(temp));
        String currentLine;

        while((currentLine = reader.readLine()) != null) {
            // trim newline when comparing with lineToRemove
            String trimmedLine = currentLine.trim();
            if(trimmedLine.equals(line)) continue;
            writer.write(currentLine + System.getProperty("line.separator"));
        }
        writer.close();
        reader.close();
        boolean successful = temp.renameTo(inFile);
    }


}
