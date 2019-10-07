package festival;

import java.sql.*;

public class BDControler {
	private Connection myconnection;
	private PreparedStatement queryPrepExistClient;
	private PreparedStatement queryPrepCheckUser;
	
	public BDControler() {
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			/*Change  cripto, username and password depending on your databse setup*/
			this.myconnection = DriverManager.getConnection("jdbc:mysql://localhost/cripto", "username", "password");

		} catch (SQLException e) {
			System.out.println("Error in constructor BDControler" + e.getMessage()); 
		}
		String sqlqueryPrepExistClient = "SELECT email FROM users WHERE email=?;";
		String sqlqueryPrepCheckUser = "SELECT email FROM users WHERE email=? AND password=?;";
		
		try {
			this.queryPrepExistClient=myconnection.prepareStatement(sqlqueryPrepExistClient);
			this.queryPrepCheckUser=myconnection.prepareStatement(sqlqueryPrepCheckUser);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	public boolean existClient(String  email){
		boolean existe=false;
		try {
		this.queryPrepExistClient.setString(1, email);
		ResultSet rs=this.queryPrepExistClient.executeQuery();
		if(rs.first()==true) {
			existe=true;
		}else {
			existe=false;
		}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return existe;
	}


	public void insertUsersInBDD(User user) {
		try {
			Statement miStatement = this.myconnection.createStatement();
			String sql = "INSERT INTO users(name, surname, password, salt, email) VALUES ('" + user.getName() + "', '" + user.getSurname() + "', '"+ user.getHashedPassword()+ "', '" + user.getSalt() +"', '" + user.getEmail() +"')";
			miStatement.executeUpdate(sql);
			miStatement.close();
			
		} catch (SQLException e) {
			System.out.println("Error en insertUsersInBDD del BDController" + e.getMessage());
		}
	}
	
	public String getSalt(String email) {
		String salt="";
		try {
			String sql="SELECT salt FROM users WHERE email='"+email+"'";
			Statement miStatement = this.myconnection.createStatement();
			ResultSet rs=miStatement.executeQuery(sql);
			rs.next();
			salt= rs.getString("salt");		
			
		} catch (Exception e) {
			System.out.println(salt);
			System.out.println(email);
		System.err.print(e);
	}
		return salt;
	}
	public boolean checkUser(String email, String hashedPassword) {
		
		boolean exist=false;
		try {
		String sql="SELECT email FROM users WHERE email='"+email+"' AND password='"+hashedPassword+"'";
		Statement miStatement = this.myconnection.createStatement();
		ResultSet rs=miStatement.executeQuery(sql);
			if(rs.first()==true) {
				exist=true;
			}else {
				exist=false;
			}
			} catch (Exception e) {
			}
		return exist;
	}
}
