package model;

import java.util.ArrayList;

/**class representing users of the application*/
public class User {

    private String firstName;
    private String lastName;
    private String username;
    private String email;
    private String password;
    private String oneLiner;

    /** set of tags describing this user*/
    private ArrayList<String> tagList;
    private ArrayList<String> locationCo_ordinates;

    /**
        For now, we only use one constructor, but there will probably more constructors later.
        The constructor initializes the user object with the passed values, initializes all lists maintained
        in this class and sets a default theme for this user. 
        @param firstName the first name of the user
        @param lastName the last name of the user
        @param username unique for a user
        @param email of the user
        @param password of the user
    */
    public User(String firstName, String lastName, String username, String email, 
            String password){
        // setting all attribute
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.password = password;
        oneLiner = "";

        // initiating tag list
        tagList = new ArrayList<String>();
        locationCo_ordinates=new ArrayList<String>();
        locationCo_ordinates.add(null);
        locationCo_ordinates.add(null);
    }

    // getters and setters

    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOneLiner() {
        return this.oneLiner;
    }

    public void setOneLiner(String oneLiner) {
        this.oneLiner = oneLiner;
    }

    public ArrayList<String> getTagList() {
        return this.tagList;
    }

    public void setTagList(ArrayList<String> tagList) {
        this.tagList = tagList;
    }

    public ArrayList<String> getLocationCo_ordinates() {
        return this.locationCo_ordinates;
    }

    public void setLocationCo_ordinates(ArrayList<String> locationCo_ordinates) {
        this.locationCo_ordinates = locationCo_ordinates;
    }

    /*
    * UTILITY
    */   

    /** 
    Adds a new tag to tag set. Duplicate tags for same user are not allowed.
    @param tag to be added
    @return boolean describing if adding was successful
    */
    public boolean addTag(String tag){
        if(tagList.contains(tag))
            return false;
        else{
            return tagList.add(tag);
        }
    }

    /** 
    Removes a tag from the tag Set. 
    @param tag to be removed
    @return boolean describing if removing was successful
    */
    public boolean removeTag(String tag){
        return tagList.remove(tag);
    }
}

