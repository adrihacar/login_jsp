package festival;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;

public class User {
	
	private String name;
	private String surname;
	private String hashedPassword;
	private String email;
	private String salt;
	
	

	public User(String name, String surname, String password, String email) {
		super();
		this.name = name;
		this.surname = surname;
		this.email = email;
		
		
		/*Create a random salt with class SecureRandom*/
		SecureRandom random = new SecureRandom();
		byte[] num = new byte[16];
		random.nextBytes(num);
		String salt=Base64.getEncoder().encodeToString(num); /*Encode the bytes generated in Base64 printable Strings*/
		
		this.salt=salt;
		this.hashedPassword= getSHA256Hash(password,salt);
	}
	
	public static String getSHA256Hash(String data, String salt) {
		 String result = null;
		 try {
			 /*Create Object digest*/
		     MessageDigest digest = MessageDigest.getInstance("SHA-256");
		     /*Add salt to object*/
		     digest.update(salt.getBytes());
		     /*Add the data(password) to object*/
		     byte[] hash = digest.digest(data.getBytes("UTF-8"));
		     /*Get the hash and encode in Base64*/
		     result = Base64.getEncoder().encodeToString(hash);
		            
		            
		 }catch(Exception ex) {
		      ex.printStackTrace();
		 }
		 return result;
		
		 }
	
		     

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	
	public String getHashedPassword() {
		return hashedPassword;
	}

	public void setHashedPassword(String hashedPassword) {
		this.hashedPassword = hashedPassword;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}



	@Override
	public String toString() {
		return "User [name=" + name + ", surname=" + surname + ", hashedPassword=" + hashedPassword + ", email=" + email + "]";
	}
}
