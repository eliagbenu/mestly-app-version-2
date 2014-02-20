package model;

import java.util.ArrayList;

import java.sql.SQLException;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.util.ArrayList;

/** class for managing all the user instances of the application*/
public class UserManager{


    static PreparedStatement pst = null;
    static ResultSet rs = null;
    static Connection con = null;

    /**
    Adds user to the database
    @param user to be added
    @throws SQLException when querying the database fails
    */
	public static void addUser(User user) throws SQLException{

        con = ConnectToPostgresSQL.connect();

        if(con==null){
            return;
        }

        String username= user.getUsername();
        String first_name= user.getFirstName();
        String last_name=user.getLastName();
        String email=user.getEmail();
        String password=user.getPassword();

        String statement = "INSERT INTO users(first_name,last_name,email,password,username)"+
                           "VALUES(?, ?, ?, ?, ?)";

        pst = con.prepareStatement(statement);

        pst.setString(1, first_name);
        pst.setString(2, last_name);                    
        pst.setString(3, email);                    
        pst.setString(4, password);                    
        pst.setString(5, username);                    

        pst.executeUpdate();        
    }

    /**
    Retrieves user from database and generates user object for given username
    @param username of the user to be retrieved
    @return corresponding user object
    @throws SQLException when querying the database fails
    */
    public static User getUser(String username) throws SQLException
    {
        User user = null;

        String first_name="";
        String last_name="";
        String email="";
        String password="";

        con = ConnectToPostgresSQL.connect();

        if(con==null){
            return null;
        }

        String statement = "select first_name,last_name,username,email,password "+
                                    "from users where username= '"+username+"'";

        pst = con.prepareStatement(statement);
        rs = pst.executeQuery();

        while(rs.next()) {
            user = new User(rs.getString(1),rs.getString(2),username,
                            rs.getString(4),rs.getString(5));         
           user.setTagList(getTagList(username));   
        }
        return user;

    }

    /**
    Deletes a user and everything associated with that entity from the database
    @param user to be deleted
    @throws SQLException when querying the database fails
    */
    public static void deleteUser(String username) throws SQLException{
        con = ConnectToPostgresSQL.connect();

        String statement = "DELETE "+
                           "FROM users "+
                           "WHERE username='"+username+"'";

        pst = con.prepareStatement(statement);
        pst.executeUpdate();        
    }
    
    /**
    Checks if username or email are already in use by queriying the database
    @param username to be checked
    @param email address to be cecked
    @return boolean describing if either username or email (or both) are already in use
    @throws SQLException when querying the database fails
    */
    public static boolean areCredentialsInUse(String username, String email) throws SQLException{

        con = ConnectToPostgresSQL.connect();

        if(con==null){
            return false;
        }

        String statement = "select first_name,last_name,username,email,password "+
                            "from users where username= '"+username+"' and "+
                            "email='"+email+"' ";

        pst = con.prepareStatement(statement);
        rs = pst.executeQuery();

        while(rs.next()) {
            return true;            
        }
        return false;
    }

    /**
    Checks if password matches username by querying the database
    @param entered username
    @param entered password
    @return boolean indicating if password matches username
    @throws SQLException when querying the database fails
    */
    public static boolean checkUserCredentials(String username, String password) throws SQLException{

        con = ConnectToPostgresSQL.connect();

        if(con==null){
            return false;
        }

        String statement = "select first_name,last_name,username,email,password "+
                            "from users where username= '"+username+"' and "+
                            "password='"+password+"' ";

        pst = con.prepareStatement(statement);
        rs = pst.executeQuery();

        while(rs.next()) {
            return true;            
        }

        return false;
    }

    /**
    Changes password for given user
    @param user with updated password
    @throws SQLException when querying the database fails
    */
    public static void updatePassword(User user) throws SQLException{

        con = ConnectToPostgresSQL.connect();

        String username= user.getUsername();
        String password=user.getPassword();

        String statement = "UPDATE users "+
                           "SET  password = '"+password+"' "+
                           "WHERE username='"+username+"'";

        pst = con.prepareStatement(statement);

        pst.executeUpdate();    
    }

    /**
    Adds tag for given user
    @param username identifiying the user
    @param tag to be added
    @throws SQLException when querying the database fails
    */
    public static void addTag(String username, String tag) throws SQLException{

        con = ConnectToPostgresSQL.connect();

        //get user
        User user = getUser(username);

        String first_name= user.getFirstName();
        String last_name=user.getLastName();
        String email=user.getEmail();
        String password=user.getPassword();

        String statement1 = "select user_tag.user_id as uid,tag "+
                            "from users,user_tag "+
                            "where users.username='"+username+"' and "+
                            " tag = '"+tag+"'";

        pst = con.prepareStatement(statement1);
        rs = pst.executeQuery();

        while(rs.next()){          
            return;
        }

        String statement2 = "select user_id "+
                            "from users "+
                            "where username='"+username+"'";

        pst = con.prepareStatement(statement2);
        rs = pst.executeQuery();

        while(rs.next()){
            Integer user_id = rs.getInt(1);

            String statement4 = "INSERT INTO user_tag(user_id,tag)"+
                               "VALUES(?, ?)";

            pst = con.prepareStatement(statement4);                    
            pst.setString(2, tag);
            pst.setInt(1, user_id);
            pst.executeUpdate();        

            ArrayList<String> tags = user.getTagList();
            tags.add(tag);               
        }

    }

    /**
    Removes for given user
    @param username identifiying the user
    @param tag to be removed
    @throws SQLException when querying the database fails
    */
    public static void removeTag(String username, String tag) throws SQLException{
        con = ConnectToPostgresSQL.connect();

        //get user
        User user = getUser(username);


        String statement1 = "Delete "+
                            "from  user_tag"+
                            " where user_id in ( "+
                             "   select user_id from users where username = '"+username+"'"+
                              "  ) and tag = '" +tag+ "' ";

    System.out.println(statement1);
        try{
        pst = con.prepareStatement(statement1);
        rs = pst.executeQuery();            
        }catch(SQLException ex){
            ex.printStackTrace();
        }

        
    }



 public static ArrayList<String> getTagList(String username) throws SQLException{
        con = ConnectToPostgresSQL.connect();

        String statement1 = "select user_tag.user_id as uid,tag "+
                            "from users,user_tag "+
                            "where users.username='"+username+"'";


        pst = con.prepareStatement(statement1);
        rs = pst.executeQuery();

       ArrayList<String> tagList = new ArrayList<String>();

        while(rs.next()){     

            String tag = rs.getString(2);
            tagList.add(tag);             
        }

        return tagList ;

    }


}