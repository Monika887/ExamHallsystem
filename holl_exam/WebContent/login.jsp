<!DOCTYPE html>
<%@page import="com.exam.utility.Adminlogin"%>
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
<div id="box" style="background-color: #e0d6f1;
background-image: linear-gradient(90deg, #e0d6f1 0%, #fdd6ff 100%);
">
<%@ include file="manew1.html" %>
</div>

<div id="box2">
<div style="float: right;"><img src="image/images (4).jpg" style="width: 257px"><br/>
<img src="image/images (6).jpg" style="width: 255px"></div>
<div align="center">
<%
   if(request.getMethod().equalsIgnoreCase("post")){
	   String login_user=request.getParameter("login_user");
	   String login_password=request.getParameter("login_password");
	   String ltype=request.getParameter("ltype");
   if(ltype.equalsIgnoreCase("admin"))
   {
	   if(new Adminlogin().adminlogin(login_user, login_password))
	   {
  session=request.getSession(false);
  session.setAttribute("admin", login_user);
  response.sendRedirect("index.jsp");  
	   }else{ %>
	   
	   <h1 style="color:red">Please Enter Valid login Details!</h1>
	   
	   <%   
   }
      }
   }
%>
  <h1>Login form</h1>
            <form method="post" action="login.jsp">
            <h2><label  for="login_user">Username<span>*</span></label>
            <input autofocus="autofocus" style="width:300px; height:25px;" type="text" name="login_user" size="40" placeholder="Enter your name" required/>
      </h2> <br/>
           <h2> <label for="email"> Password<span>*</span></label>
            <input style="width:300px; height:25px;" type="password" name="login_password" id="email" value="" size="40" placeholder="******************" required/>
           </h2><br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp; 
         <select style="width:300px; height:25px" name="ltype" required>
         <option value="">-----Select Login Type-----</option>
         <option value="admin">Admin</option>
          <option value="student" >Student</option>
         </select>
         
         <br/>
         <br/>
         <div>
            <input name="submit" type="submit" value="Login">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="reset" type="reset" value="Cancel">
		</div>
        <br/>
      
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
		  <div align="center"><a href="forgot-password.jsp">Forgot Password</a></div>
        </form>
        </div>
           
   
   
             
   </div>
 </body>
</html>