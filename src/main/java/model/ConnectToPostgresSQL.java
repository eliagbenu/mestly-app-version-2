package model;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectToPostgresSQL  
{

    public static Connection connect() throws SQLException 
    {

        Connection con = null;
        Properties props = new Properties();
        FileInputStream in = null;
        
        try {
            Class.forName("org.postgresql.Driver");
            in = new FileInputStream("database.properties");
            props.load(in);

        }catch(ClassNotFoundException ex){
            ex.printStackTrace();

        } catch (IOException ex) 
        {

            Logger lgr = Logger.getLogger(ConnectToPostgresSQL.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);

        } finally 
        {


            
            try {
                 if (in != null) {     
                     in.close();

                    String url = props.getProperty("db.url");
                    String user = props.getProperty("db.user");
                    String passwd = props.getProperty("db.passwd");

                    try{
                         con = DriverManager.getConnection(url, user, passwd);
                     }catch(SQLException sq){
                        System.out.println("Error: "+sq.getMessage());
                     }
                    return con;
                 }
            } catch (IOException ex) {

                Logger lgr = Logger.getLogger(ConnectToPostgresSQL.class.getName());
                lgr.log(Level.SEVERE, ex.getMessage(), ex);
                return null;
            }
        }


        return con;
    }


}