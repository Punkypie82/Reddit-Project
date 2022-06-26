import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class FileAddresses {
    public static void main(String [] args){
        File f1=new File("AddPost.txt");
        try{
            FileWriter fw1=new FileWriter(f1);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
