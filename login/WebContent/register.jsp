<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Festival | Register</title>
  </head>
  <body>
	  
 	
		<!-- Default form register -->
	<form action='/cripto/server-operations.jsp?type=new-user' method='post' class='text-center border border-light p-5 container' style='width:650px; margin-top: 100px;'>
	
	    <p class='h4 mb-4'>Sign up</p>
	
	    <div class='form-row mb-4'>
	        <div class='col'>
	            <!-- First name -->
	            <input name='Name' type='text' id='defaultRegisterFormFirstName' class='form-control' placeholder='First name'>
	        </div>
	        <div class='col'>
	            <!-- Last name -->
	            <input name='Surname' type='text' id='defaultRegisterFormLastName' class='form-control' placeholder='Last name'>
	        </div>
	    </div>
	
	    <!-- E-mail -->
	    <input name='Email' type='email' id='defaultRegisterFormEmail' class='form-control mb-4' placeholder='E-mail'>
	
	    <!-- Password -->
	    <input name='Password' type='password' id='defaultRegisterFormPassword' class='form-control' placeholder='Password' aria-describedby='defaultRegisterFormPasswordHelpBlock'>
	    <small id='defaultRegisterFormPasswordHelpBlock' class='form-text text-muted mb-4'>
	        At least 8 characters and 1 digit
	    </small>
	
	    <!-- Sign up button -->
	    <button class='btn btn-info my-4 btn-block' type='submit'>Sign in</button>
	
	    <hr>
	
	    <!-- Terms of service -->
	    <p>By clicking
	        <em>Sign up</em> you agree to our
	        <a href='' target='_blank'>terms of service</a>
	
	</form>
 
  }
  <%
	String success = request.getParameter("success");
  if(success!=null && success.equalsIgnoreCase("client-create-success")){%>
  			<meta http-equiv='refresh' content='1; url=login.jsp'>
  
		  <%} 
	String error = request.getParameter("error");
	  if(error!=null && error.equalsIgnoreCase("client-exist")){
			  out.print("<h3 style='color:red'>User already exists</h3>");
			  }
 %>


	<!-- Default form register -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>