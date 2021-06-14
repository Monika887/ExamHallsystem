<%
String admin=(String) session.getAttribute("admin");
if(admin==null){
	session.removeAttribute("login.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
<title>ADD NEW</title>
<link href="css/second.css" type="text/css" rel="stylesheet"/>

<style type="text/css">
body
{
background-image:url("image/download\ \(2\).jpg");
background-size:cover;
}
#boxedd
{   
     text-decoration:none;
	border: 4px outset #ccc;
	padding:6.7px;
	background-color:#303;
	color: #fff;
}
</style>
    </head>
    <body>
<div id="box">
<%@ include file="manew.html" %>
</div>

<div id="box2">
<div style="float: right;">
        	<div><img src="image/index.jpg" style="width: 820px"></div><br>
        	
        </div>
    <div align="left">
<h2>
    <br/>&nbsp;&nbsp;&nbsp;<a id="boxedd" href="addroom.jsp">Add Rooms&nbsp;&nbsp;&nbsp;</a><br/><br/>
    &nbsp;&nbsp;&nbsp;<a id="boxedd" href="addfloor.jsp">ADD Floor&nbsp;&nbsp;&nbsp;&nbsp;</a><br/><br/>
    &nbsp;&nbsp;&nbsp;<a id="boxedd" href="addBlock.jsp">ADD Block&nbsp;&nbsp;&nbsp;&nbsp;</a><br/><br/>
    &nbsp;&nbsp;&nbsp;<a id="boxedd" href="addseat.jsp">Add Seat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><br/><br/>
    &nbsp;&nbsp;&nbsp;<a id="boxedd" href="addstudent.jsp">Add student&nbsp;&nbsp;&nbsp;</a><br/><br/>
    &nbsp;&nbsp;&nbsp;<a id="boxedd" href="addassing.jsp">Assing Seat&nbsp;&nbsp;&nbsp;&nbsp;</a><br/>
</h2>
</div>
</div>


<div id="box3">

</div>
    </body>
</html>