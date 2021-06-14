<%@page import="com.exam.utility.Adminlogin"%>
<%@page import="com.exam.student_seat.StudentseatD"%>
<%@page import="com.exam.student_seat.StudentseatB"%>
<!DOCTYPE html>
<html>
    <head>
<title>home page</title>
<link href="css/second.css" type="text/css" rel="stylesheet"/>
<style type="text/css">
body
{
background-image:url("image/download\ \(2\).jpg");
background-size:cover;
}
</style>
    </head>
    <body>
<div id="box">
<%@ include file="manew1.html" %>
</div>

<div id="box2">
<!-- text in box to write this space-->
<div align="center">
<form method="post" action="sarch.jsp">
  <h1>Search Your Seat</h1>
 <label for="student_seat">Enter Your roll number<span>*</span></label><br/>
 <input autofocus="autofocus" type="text" name="student_seat"  id="name" value="" size="40" required>
 
  
 <br/>
 <br/>
 <div>
           <input name="submit" type="submit" value="Search Seat">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input name="reset" type="reset" value="Reset Form">
			<input type="hidden" name="act" value="chk_login">
 </div>
<br/>
<br/>
</form>
</div>
</div>


    </body>
</html>