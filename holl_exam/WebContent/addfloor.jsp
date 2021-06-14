<%@page import="com.exam.floor.floorBean"%>
<%@page import="com.exam.floor.floorDao"%>
<%
if(request.getMethod().equalsIgnoreCase("post"))
{
	%>
	<jsp:useBean id="bean" class="com.exam.floor.floorBean"></jsp:useBean>
	<jsp:setProperty property="*" name="bean"/>
	<% 
	if(new floorDao().addfloor(bean)){
		response.sendRedirect("viwfloors.jsp");
	}
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
<title>Floor Add</title>
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
<%@ include file="manew.html" %>
</div>

<div id="box2" style="background: url(image/main_1.jpg);
     background-size:cover; ">
<div align="center">

  <h1>Floor Entry Form</h1>
  <form method="post" action="addfloor.jsp">
 <label for="floor_name">Floor Name<span>*</span></label>
 <input style="width:310px; height:25px;"  type="text" name="floor_name" size="40" required>
 <br/>
 <br/>
             
<div>
            <label for="floor_description">Description<span>*</span></label>
			  &nbsp;&nbsp;<textarea style="width:318px; height:60px;" name="floor_description" required></textarea>
          </div>
          <br/>
          <br/> 
 <div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="submit" type="submit" value="Save Floor">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input name="reset" type="reset" value="Reset Form">
			</div>
<br/>
<br/>
</form>
</div>
</div>


    </body>
</html>