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


    /**
    Adds user to the database
    @param user to be added
    @throws SQLException when querying the database fails
    */
	public static void addUser(User user) throws SQLException{
        PreparedStatement pst = null;
        Connection con = null;
        con = ConnectToPostgresSQL.connect();

        if(con==null){
            return;
        }

        String username= user.getUsername();
        String first_name= user.getFirstName();
        String last_name=user.getLastName();
        String email=user.getEmail();
        String password=user.getPassword();

        try{
            String statement = "INSERT INTO users(first_name,last_name,email,password,username)"+
                               "VALUES(?, ?, ?, ?, ?)";

            pst = con.prepareStatement(statement);

            pst.setString(1, first_name);
            pst.setString(2, last_name);                    
            pst.setString(3, email);                    
            pst.setString(4, password);                    
            pst.setString(5, username);                    

            pst.executeUpdate();        
        }catch(SQLException sqlEx){
            sqlEx.printStackTrace();
            throw sqlEx;
        }finally{
            try{
                if(pst != null){
                    pst.close();
                }
                
                if(con != null){
                    con.close();
                }
                
            }catch(SQLException ex){
                ex.printStackTrace();
                throw ex;
            }
        }
    }

    /**
    Retrieves user from database and generates user object for given username
    @param username of the user to be retrieved
    @return corresponding user object
    @throws SQLException when querying the database fails
    */
    public static User getUser(String username) throws SQLException
    {
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;

        User user = null;

        String first_name="";
        String last_name="";
        String email="";
        String password="";

        con = ConnectToPostgresSQL.connect();

        if(con==null){
            return null;
        }

        try{
            String statement = "select first_name,last_name,username,email,password "+
                                "from users where username= ? ";

            pst = con.prepareStatement(statement);
            pst.setString(1, username);                            
            rs = pst.executeQuery();

            while(rs.next()) {
                user = new User(rs.getString(1),rs.getString(2),username,
                                rs.getString(4),rs.getString(5));         
               user.setTagList(getTagList(username));   
               user.setLocationCo_ordinates(getLocationCo_ordinates(username));   
            }

        }catch(SQLException sqlEx){
            sqlEx.printStackTrace();
            throw sqlEx;
        }finally{
            try{

                if(rs != null){
                    rs.close();
                }

                if(pst != null){
                    pst.close();
                }

                if(con != null){
                    con.close();
                }
                
                return user;
            }catch(SQLException ex){
                ex.printStackTrace();
                throw ex;
            }

        }



    }

    /*get all users*/
    public static ArrayList<String> getAllUsers() throws SQLException
    {
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;

        ArrayList<String> allUsers = new ArrayList<String>(); 

        con = ConnectToPostgresSQL.connect();

        if(con==null){
            return null;
        }

        try{
            String statement = "select username"+
                                " from users";

            pst = con.prepareStatement(statement);
            rs = pst.executeQuery();

            while(rs.next()) {

                String this_user = rs.getString("username");
                allUsers.add(this_user);

            }

        }catch(SQLException sqlEx){
            sqlEx.printStackTrace();
            throw sqlEx;
        }finally{
            try{

                if(rs != null){
                    rs.close();
                }

                if(pst != null){
                    pst.close();
                }

                if(con != null){
                    con.close();
                }
                
                return allUsers;
            }catch(SQLException ex){
                ex.printStackTrace();
                throw ex;
            }

        }



    }
    /**
    Deletes a user and everything associated with that entity from the database
    @param user to be deleted
    @throws SQLException when querying the database fails
    */
    public static void deleteUser(String username) throws SQLException{
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;

        con = ConnectToPostgresSQL.connect();

        try{
            String statement = "DELETE "+
                               "FROM users "+
                               "WHERE username=?";
         
            pst = con.prepareStatement(statement);
            pst.setString(1, username);                            
            pst.executeUpdate();

        }catch(SQLException sqlEx){
            sqlEx.printStackTrace();
            throw sqlEx;
        }finally{
            try{
                pst.close();
                con.close();
            }catch(SQLException ex){
                ex.printStackTrace();
                throw ex;
            }finally{
            try{

                if(pst != null){
                    pst.close();
                }

                if(con != null){
                    con.close();
                }

            }catch(SQLException ex){
                ex.printStackTrace();
                throw ex;
                }
            }
        }                           
    }
    
    /**
    Checks if username or email are already in use by queriying the database
    @param username to be checked
    @param email address to be cecked
    @return boolean describing if either username or email (or both) are already in use
    @throws SQLException when querying the database fails
    */
    public static boolean areCredentialsInUse(String username, String email) throws SQLException{
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;

        con = ConnectToPostgresSQL.connect();

        if(con==null){
            return false;
        }

        String statement = "select count(*) as figure "+
                            "from users where username= ? or "+
                            "email=?  "+
                            " having count(*) =1";
        boolean truthValue=false;                    

        try{
            pst = con.prepareStatement(statement);
            pst = con.prepareStatement(statement);
            pst.setString(1, username);                                    
            pst.setString(2, email);                                            
            rs = pst.executeQuery();

            while(rs.next()) {
                truthValue = true;            
            }
            truthValue = false;
        }catch(SQLException sqlEx){
            sqlEx.printStackTrace();
            throw sqlEx;
        }finally{
            try{

                if(pst != null){
                    pst.close();
                }

                if(con != null){
                    con.close();
                }
                return truthValue;
            }catch(SQLException ex){
                ex.printStackTrace();
                throw ex;
            }
        }
    }

    /**
    Checks if password matches username by querying the database
    @param entered username
    @param entered password
    @return boolean indicating if password matches username
    @throws SQLException when querying the database fails
    */
    public static boolean checkUserCredentials(String username, String password) throws SQLException{
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;

        con = ConnectToPostgresSQL.connect();
        boolean truthValue=false;

        if(con==null){
            return false;
        }

        try{
            String statement = "select first_name,last_name,username,email,password "+
                "from users where username= ? and "+
                "password=? ";

            pst = con.prepareStatement(statement);
            pst.setString(1, username);                                    
            pst.setString(2, password);                                                
            rs = pst.executeQuery();

            while(rs.next()) {
            truthValue= true;            
            }

        }catch(SQLException sqlEx){
            sqlEx.printStackTrace();
            throw sqlEx;
        }finally{
            try{

                if(rs != null){
                    rs.close();
                }

                if(pst != null){
                    pst.close();
                }

                if(con != null){
                    con.close();
                }
                return truthValue;
            }catch(SQLException ex){
                ex.printStackTrace();
                throw ex;
            }
        }
    }

    /**
    Changes password for given user
    @param user with updated password
    @throws SQLException when querying the database fails
    */
    public static void updatePassword(User user) throws SQLException{
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;

        con = ConnectToPostgresSQL.connect();

        String username= user.getUsername();
        String password=user.getPassword();

        String statement = "UPDATE users "+
                           "SET  password = ? "+
                           "WHERE username=?";

        try{
            pst = con.prepareStatement(statement);
            pst.setString(1,password);
            pst.setString(2,username);
            pst.executeUpdate();    
        }catch(SQLException sqlEx){
            sqlEx.printStackTrace();
            throw sqlEx;
        }finally{
            try{

                if(pst != null){
                    pst.close();
                }

                if(con != null){
                    con.close();
                }

            }catch(SQLException ex){
                ex.printStackTrace();
                throw ex;
            }
        }
    }

    /**
    Adds tag for given user
    @param username identifiying the user
    @param tag to be added
    @throws SQLException when querying the database fails
    */
    public static void addTag(String username, String tag) throws SQLException{
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;

        con = ConnectToPostgresSQL.connect();

        //get user
        User user = getUser(username);

        String statement = "INSERT INTO user_tag(username,tag)"+
                            "VALUES(?, ?)";


        try{
            pst = con.prepareStatement(statement);                    
            pst.setString(2, tag);
            pst.setString(1, username);
            pst.executeUpdate();        

            ArrayList<String> tags = getTagList(username);
            tags.add(tag);       
        }catch(SQLException sqlEx){
            sqlEx.printStackTrace();
            throw sqlEx;
        }finally{
            try{

                if(pst != null){
                    pst.close();
                }

                if(con != null){
                    con.close();
                }

            }catch(SQLException ex){
                ex.printStackTrace();
                throw ex;
            }

        }        
    }


    /**
    Removes for given user
    @param username identifiying the user
    @param tag to be removed
    @throws SQLException when querying the database fails
    */
    public static void removeTag(String username, String tag) throws SQLException{
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;

        con = ConnectToPostgresSQL.connect();

        //get user
        User user = getUser(username);


        String statement1 = "Delete "+
                            "from  user_tag "+
                            " where username =  ? and "+
                            " tag= ? ";

        try{
            pst = con.prepareStatement(statement1);
            pst.setString(1,username);
            pst.setString(2,tag);
            pst.executeUpdate();   
        }catch(SQLException ex){
            ex.printStackTrace();
            throw ex;
        }finally{
            try{

                if(pst != null){
                    pst.close();
                }

                if(con != null){
                    con.close();
                }

            }catch(SQLException ex){
                ex.printStackTrace();
                throw ex;
            }

        }
        
    }


 public static ArrayList<String> getTagList(String username) throws SQLException{
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;

        con = ConnectToPostgresSQL.connect();
        ArrayList<String> tagList = new ArrayList<String>();

        String statement1 = "select * "+
                            "from user_tag "+
                            "where username='"+username+"'";


        try{
        pst = con.prepareStatement(statement1);
        rs = pst.executeQuery();

        while(rs.next()){     

            String tag = rs.getString("tag");
            tagList.add(tag);             
        }

        return tagList;            
        }catch(SQLException ex){
            ex.printStackTrace();
            throw ex;
        }finally{
            try{

                if(rs != null){
                    rs.close();
                }

                if(pst != null){
                    pst.close();
                }

                if(con != null){
                    con.close();
                }
              //  System.out.println("tagList is "+tagList);
                return tagList;
            }catch(SQLException ex){
                ex.printStackTrace();
                throw ex;
            }
        }
    }


 public static ArrayList<String> getLocationCo_ordinates(String username) throws SQLException{
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;

        con = ConnectToPostgresSQL.connect();
        ArrayList<String> locationCo_ordinates = new ArrayList<String>();

        String statement1 = "select * "+
                            "from user_location "+
                            "where username='"+username+"'";


        try{
        pst = con.prepareStatement(statement1);
        rs = pst.executeQuery();

        while(rs.next()){     
            String lat = rs.getString("lat");
            String lng = rs.getString("lng");
            locationCo_ordinates.add(lat);         
            locationCo_ordinates.add(lng);                        
        }

        return locationCo_ordinates;            
        }catch(SQLException ex){
            ex.printStackTrace();
            throw ex;
        }finally{
            try{

                if(rs != null){
                    rs.close();
                }

                if(pst != null){
                    pst.close();
                }

                if(con != null){
                    con.close();
                }

                return locationCo_ordinates;
            }catch(SQLException ex){
                ex.printStackTrace();
                throw ex;
            }
        }
    }



//update the location
    public static void updateLocationCo_ordinates(String username, String lat,String lng) throws SQLException{
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;

        con = ConnectToPostgresSQL.connect();

        //get user
        User user = getUser(username);

        String statement = "update user_location set "+
                            " lat= ? ,"+
                            " lng=? "+
                            " where username = ?";

        ArrayList<String> locationCo_ordinates = new ArrayList<String>();
        locationCo_ordinates.add(lat);
        locationCo_ordinates.add(lng); 

        user.setLocationCo_ordinates(locationCo_ordinates);

        try{
            pst = con.prepareStatement(statement);                    
            pst.setString(2, lng);
            pst.setString(1, lat);            
            pst.setString(3, username);

            pst.executeUpdate();        

        }catch(SQLException sqlEx){
            sqlEx.printStackTrace();
            throw sqlEx;
        }finally{
            try{

                if(pst != null){
                    pst.close();
                }

                if(con != null){
                    con.close();
                }

            }catch(SQLException ex){
                ex.printStackTrace();
                throw ex;
            }

        }        
    }

}