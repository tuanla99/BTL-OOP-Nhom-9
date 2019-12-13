package connectionDB;

import java.sql.*;

public class ConnectionDB {
    public static Connection getConnectionDB() {
        Connection connection = null;

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=oop_project","sa","1234");
        }catch (ClassNotFoundException | SQLException ex){
            ex.printStackTrace();
        }
        return connection;

        /*
        Su dung Tomcat. va SQL Server
        url : jdbc:sqlserver://localhost:1433
        databaseName : < ten db can ket noi>
        user : sa ; password: 1234 : Do moi nguoi dat trong SQL Server

        Khi can tao connection den database :
        Connection connection = ConnectionDB.getConnectionDB;
        Statement statement = connection.createStatement;
        ...
         */

    }

}
