package util;


import java.util.logging.Level;
import java.util.logging.Logger;

import java.util.Properties;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileInputStream;

import java.io.IOException;

//import persistence.DataManager;


public class Bootstrap {

	public static boolean run() {

        Properties props = new Properties();


            try{
           FileInputStream in = new FileInputStream("database.properties");
            props.load(in);

            }catch(IOException ioex){
            	ioex.printStackTrace();
            }

		//Properties props = DataManager.loadProperties();

        String url = props.getProperty("db.url");
        String dbuser = props.getProperty("db.user");
        String password = props.getProperty("db.passwd");

		Connection con = null;

		// run script
		try {

			con = DriverManager.getConnection(url, dbuser, password);
			ScriptRunner runner = new ScriptRunner(con, true, false);
			runner.runScript(new BufferedReader(new FileReader("database.sql")));
		} catch (SQLException ex) {

			logException(ex);
			return false;
		} catch (IOException io) {

			logException(io);
			return false;
		}finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException ex) {
				logException(ex);
			}
		}
		
		return true;
	}

	private static void logException(Exception ex) {
		Logger lgr = Logger.getLogger(Bootstrap.class.getName());
		lgr.log(Level.WARNING, ex.getMessage(), ex);
	}
}