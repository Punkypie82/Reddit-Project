import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

public class Main2 {
    static boolean serverOn=true;
    static int port=6666;
    public static void main(String[] args){
        try{
//            FileController.getFileController().addFileController("Users", new Controller("Uses.txt"));
            ServerSocket ss= new ServerSocket(port);
            while(serverOn==true){
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
        public void run() {

            String ans = "nothing";
            String wStr = "nothing";
            String input = handeler();
            String[] splitted = input.split(",");
            for (int i = 0; i < splitted.length; i++) {
                System.out.println(splitted[i]);
            }

            if (splitted[0].equals("Register")) {

                String id = splitted[1] + splitted[2];
                String username = splitted[1];
                String password = splitted[2];
                String email = splitted[3];
                boolean usernameExists = false;
                boolean emailExists = false;

                try {
                    BufferedReader reader = new BufferedReader(new FileReader("users.txt"));
                    String line = reader.readLine();
                    while (line != null) {
                        if (username == line.split(",")[1]) {usernameExists = true;}
                        if (email == line.split(",")[3]) {emailExists = true;}
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }

                if (emailExists && usernameExists) {
                    try {
                        dout.writeBytes("Email & Username Exists.");
                        dout.flush();
                        dout.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    System.out.println("Email & Username Exists");
                }
                else if (usernameExists && !(emailExists)) {
                    try {
                        dout.writeBytes("Username Exists");
                        dout.flush();
                        dout.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    System.out.println("Username Exists");
                }
                else if (emailExists && !(usernameExists)) {
                    try {
                        dout.writeBytes("Email Exists");
                        dout.flush();
                        dout.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    System.out.println("Email Exists");
                }
                else if (!(emailExists) && !(usernameExists)) {
                    try {
                        dout.writeBytes("User Created");
                        dout.flush();
                        dout.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    System.out.println("User Created");

                    wStr = id + "," + username + "," + password + "," + email + "\n";
                    System.out.println(wStr);
                    try {
                        FileWriter myWriter = new FileWriter("users.txt", true);
                        myWriter.write(wStr);
                        myWriter.flush();
                        myWriter.close();
                        System.out.println("Successfully wrote to the file.");
                    } catch (IOException e) {
                        System.out.println("An error occurred.");
                        e.printStackTrace();
                    }
                }
            }

            if (splitted[0].equals("Login")) {

                String id = splitted[1] + splitted[2];
                String username = splitted[1];
                String password = splitted[2];
                boolean userExists = true;

                try {
                    BufferedReader reader = new BufferedReader(new FileReader("users.txt"));
                    String line = reader.readLine();
                    while (line != null) {
                        if (id == line.split(",")[1]) {userExists = false;}
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }

                if (userExists) {
                    try {
                        dout.writeBytes("Login Successful");
                        dout.flush();
                        dout.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    System.out.println("Login Successful");
                }
                else {
                    try {
                        dout.writeBytes("Login Failed");
                        dout.flush();
                        dout.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    System.out.println("Login Failed");
                }
            }

            if (splitted[0].equals("Comment")) {

                String username = splitted[1];
                String commment = splitted[2];
                boolean userExists = true;
                wStr = username + "," + commment + "\n";

                try {
                    FileWriter myWriter = new FileWriter("comments.txt", true);
                    myWriter.write(wStr);
                    myWriter.flush();
                    myWriter.close();
                    System.out.println("Successfully wrote to the file.");
                } catch (IOException e) {
                    System.out.println("An error occurred.");
                    e.printStackTrace();
                }
            }
        }
    }
}
