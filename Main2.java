import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Main2 {
    static boolean serverOn=true;
    static int port=6666;
    public static void main(String[] args){
        try{
            FileController.getFileController().addFileController("AddPost", new Controller("AddPost.txt"));
            ServerSocket ss= new ServerSocket(port);
            while(serverOn==true){
                Socket s=ss.accept();
                DataInputStream dis = new DataInputStream(s.getInputStream());
                int input = dis.read();
                System.out.println("works...");
                System.out.println(input);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
//    static class serverThread extends Thread {
//        Socket s;
//        DataOutputStream dout;
//        DataInputStream din;
//
//        serverThread(Socket s) {
//            this.s = s;
//            try {
//                din = new DataInputStream(s.getInputStream());
//                dout = new DataOutputStream(s.getOutputStream());
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//
//
//        String handeler() {
//            StringBuilder num = new StringBuilder();
//            StringBuilder str = new StringBuilder();
//            char i;
//            try {
//                while ((i = (char) din.read()) != ',') {
//                    System.out.println(i);
//                    num.append(i);
//                }
//                int counter=Integer.parseInt(num.toString());
//                for(int j=0 ; j<counter ; j++){
//                    str.append((char) din.read());
//                }
//
//            } catch (IOException e) {
//                  try {
//                      din.close();
//                      dout.close();
//                      s.close();
//
//                  } catch (IOException ex) {
//                      ex.printStackTrace();
//                  }
//            }
//            return str.toString();
//        }
//
//        void writer(String write){
//            if(write != null && !write.isEmpty()){
//                try{
//                    dout.writeUTF(write);
//                    //can check here with print
//                } catch (IOException e) {
//                    try{
//                        din.close();
//                        dout.close();
//                        s.close();
//                    }catch (IOException ex) {
//                        ex.printStackTrace();
//                    }
//                    e.printStackTrace();
//                    }
//
//                }
//
//            }
//
//            @Override
//        public void run(){
//            String ans="nothing";
//            String input=handeler();
//            System.out.println(input);
//        }
//
//
//    }

}
