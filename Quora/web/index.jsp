
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,300italic' rel='stylesheet' type='text/css'>
  </head>
  <body>
  	<header>
	<div>
  	<a href="index.jsp"> <img id="logo" src="logo.png" alt="Quora"/> </a>
	</div>
  	</header>
  	<h1 id="form-title" class="center">Login</h1>
      <div class="center" id="login-section">
          <form class="center" name="loginForm" id="login-form" action="LoginServlet" method="post">
        <label id="error_msg" class="err_msg"></label>

        <label class="small_err" id="email_err"></label>
        <input type="text" id="email" name="email" placeholder="User email"> <br /><br />

        <label class="small_err" id="pass_err"></label>
        <input type="password" id="password" name="password" placeholder="Password"><br /><br />

        <input type="submit" name="loginbutton" id="login-button" value="Login" /><br /><br />
        <label id="login-signup-link">Don't have an account?
        <a href="form-signup.html">Sign up!</a> </label>
      </form>
      </div>
  <script type="text/javascript" src="script.js"> </script>
  </body>
</html>