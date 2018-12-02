<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileOutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    HttpSession nsession = request.getSession(false);
    if(nsession!=null) {
       String Email1=(String)session.getAttribute("Useremail");
       try
        {   
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/quora?useSSL=false","root","saibbskat1208");
            String sql_query="select * from Registration where Email=?";
            PreparedStatement pstmt=conn.prepareStatement(sql_query);
            pstmt.setString(1,Email1);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
            {
                Blob blob=rs.getBlob(5);
                byte byteArray[]=blob.getBytes(1, (int)blob.length());
                FileOutputStream fout=new FileOutputStream("C:/Users/saika/Documents/NetBeansProjects/Quora/web/images/avatar.png");
                fout.write(byteArray);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Question Detail</title>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,300italic' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="script.js"></script>
  </head>
  <body>
  	<header id="fixed-header">
        <a href="index.jsp"> <img id="logo" src="logo.png" alt="Quora"/> </a>
        <a href="index.jsp" id="header-login">Logout</a>
    </header>

    <a href="form-question.jsp"><img src="FAB.png" alt="Submit a question" title="Submit a question" id="FAB" /></a>


	<div id="user-question">


		<img src="images/avatar.png" alt="Avatar" id="qd-avatar" />
		<p id="qd-username"></p>
                
        <br />
		<p id="qd-question"></p>
       
        <br /> <hr />
        <a href="form-answer.jsp" class="answer-button">Answer!</a>

	</div>

<div id="answer-list">

	<div class="qd-answer">
        <aside class="votes">

            <img src="upvote-grey.png" class="upvote-arrow" /> 
            <label class="upvote-count">Upvotes</label>
            <br />

            <img src="downvote-grey.png" class="downvote-arrow" /> 
            <label class="downvote-count">Downvotes</label>
        </aside>
        

        <aside class="answerer-info">
            <label class="answer-username"></label>
        </aside>
        <hr />
        <label class="answer-text"></label>
	</div>

    <div class="qd-answer post-display no-answers">There are no answers yet.<br />Be the first!</div>

    </div>
    <script type="text/javascript" src="script-qd.js"></script>
    </body>
</html>
<%}}
catch(Exception e)
{
    out.println(e);
}
}
else
  response.sendRedirect("index.jsp");
%>