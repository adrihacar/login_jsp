<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="festival.*"
	import= "javax.servlet.*"
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	BDControler bdControler = new BDControler();

	String type = request.getParameter("type");
	
	if(type!=null && type.equalsIgnoreCase("new-user")){
		String Name="";
		String Surname="";
		String Email="";
		String Password="";
	
		Name=request.getParameter("Name");
		Surname=request.getParameter("Surname");
		Email=request.getParameter("Email");
		Password=request.getParameter("Password");
	
	if (bdControler.existClient(Email)) {
		response.sendRedirect("/access/register.jsp?error=client-exist");
		
	} else {
		
		bdControler.insertUsersInBDD(new User(Name, Surname, Password, Email));
		response.sendRedirect("register.jsp?success=client-create-success");
	}
}
	
	

	if(type!=null && type.equalsIgnoreCase("login-user")){

		String Email="";
		String Password="";
		String hashedPassword="";
		
		Email=request.getParameter("Email");
		Password=request.getParameter("Password");
		
		String salt=bdControler.getSalt(Email);	//sacamos el salt de la base datos
		hashedPassword = User.getSHA256Hash(Password, salt);
		
		if(bdControler.checkUser(Email, hashedPassword)){	
			response.sendRedirect("index.jsp?user="+ Email);
			
		}else{
			response.sendRedirect("login.jsp?status=error");
			
		}
		
		
	}
%>

</body>
</html>