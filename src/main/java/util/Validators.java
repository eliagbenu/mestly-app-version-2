package util;

import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

public class Validators {

    public static boolean isValidUsername(String username) {
        return username.length()>=4;
    }
    
    public static boolean isValidName(String username) {
        return username.length()>=2;
    }

    public static boolean isValidEmailAddress(String email) {
        boolean result = true;
        try {
            InternetAddress emailAddr = new InternetAddress(email);
            emailAddr.validate();
        } catch (AddressException e) {
            result = false;
        }
        return result;
    }
    
    public static boolean isValidURL(String url) {
        boolean result = true;
        try {
            URL u = new URL(url);
            u.toURI();
        } catch (URISyntaxException e) {
            result = false;
        } catch (MalformedURLException e) {
            result = false;
        }
        return result;
    }

    public static boolean isValidPassword(String password) { 
        return password.length()>=8 && password.matches(".*[a-zA-Z].*") &&
        password.matches(".*[0-9].*");
    }  

    public static boolean isIdenticalPassword(String password1, String password2) { 
        return password1.equals(password2); 
    }   
    
    // public static boolean isValidDate(String dateString) {
    //     boolean result = true;
    //     try {
    //         SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    //         sdf.parse(dateString);
    //     } catch (ParseException e) {
    //         result = false;
    //     }
    //     return result;
    // }    
}
