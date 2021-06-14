<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <script>
function isValid(frm_obj)
{
	if(frm_obj.old_password.value == "")
	{
		frm_obj.old_password.focus();
		alert("Please enter the old password.")
		return false;
	}
	if(frm_obj.new_password.value == "")
	{
		frm_obj.new_password.focus();
		alert("Please enter the new password.")
		return false;
	}
	if(frm_obj.confirm_password.value == "")
	{
		frm_obj.confirm_password.focus();
		alert("Please enter the confirm password.")
		return false;
	}
	if(frm_obj.confirm_password.value != frm_obj.new_password.value)
	{
		frm_obj.new_password.focus();
		alert("New Password and confirm password doesnot match.")
		return false;
	}
	return true;
}
</script>

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

  <h1>Change Password Form</h1>
   <% if(request.getParameter("login_password") != null) { %>
		<div><%=request.getParameter("login_password")%></div>
		<% } %>
  <form method="post" action="index.jsp">
            <label for="name">Old Password<span>*</span></label> 
            <input type="password" name="login_user"  id="name" value="" size="40"  required/>
        <br/>
        <br/>
        <br/>
            <label for="email">New password<span>*</span></label>
            <input type="password" name="login_password" id="email" value="" size="40" required/>
         
         <br/>
         <br/>
         <br/>
         <label for="email">Conform password<span>*</span></label>
            <input type="password" name="login_password" id="email" value="" size="40" required/>
         
         <br/>
         <br/>
         <br/>
       
           
         <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="reset" type="reset" value="Reset password">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="reset" type="reset" value="Cancel">
			<input type="hidden" name="act" value="chk_login">
         </div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </form>
        </div>
    </div>
   
 </body>
</html>