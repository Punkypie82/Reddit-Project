import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

public class Core {
    static boolean serverOn=true;
    static int port=6666;
    public static void main(String[] args){
        try{
            FileController.getFileController().addFileController("AddPost", new Controller("AddPost.txt"));
            ServerSocket ss= new ServerSocket(port);
            while( serverOn==true){
                Socket s=ss.accept();
                System.out.println("works...");
                serverThread st= new serverThread(s);
                st.start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
    static class serverThread extends Thread {
        Socket s;
        DataOutputStream dout;
        DataInputStream din;

        serverThread(Socket s) {
            this.s = s;
            try {
                din = new DataInputStream(s.getInputStream());
                dout = new DataOutputStream(s.getOutputStream());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


        String handeler() {
            StringBuilder num = new StringBuilder();
            StringBuilder str = new StringBuilder();

            char i;
            String line="";
            try {
                Scanner in = new Scanner(s.getInputStream());
                while (in.hasNextLine()){
                    //process each line in some way
                     line = in.nextLine();

                }
            } catch (IOException e) {
                  try {
                      din.close();
                      dout.close();
                      s.close();

                  } catch (IOException ex) {
                      ex.printStackTrace();
                  }
            }

            return line;
        }

        void writer(String write){
            if(write != null && !write.isEmpty()){
                try{
                    dout.writeUTF(write);
                    //can check here with print
                } catch (IOException e) {
                    try{
                        din.close();
                        dout.close();
                        s.close();
                    }catch (IOException ex) {
                        ex.printStackTrace();
                    }
                    e.printStackTrace();
                    }

                }

            }

            @Override
        public void run(){
            String ans="nothing";
            String input=handeler();
            System.out.println(input);

        }


    }

}
