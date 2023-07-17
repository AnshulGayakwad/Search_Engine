package org.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    static Connection connection = null;
    public static Connection getConnection(){
        if(connection != null){
            return connection;
        }

        //Credentials of MYSQL databases
        String user = "root";
        String pwd = "volkswagen";
        String db = "searchengineapp";

        return getConnection(user, pwd, db);
    }

    private static Connection getConnection(String user, String pwd, String db){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/" + db + "?user=" + user + "&password=" + pwd);
            return connection;
        }
        catch(SQLException | ClassNotFoundException sqlException){
            sqlException.printStackTrace();
        }

        return connection;
    }
}
