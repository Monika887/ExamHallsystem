<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
<title>Report</title>
<link href="css/second.css" type="text/css" rel="stylesheet"/>
<style type="text/css">
body
{
background-image:url("image/download\ \(2\).jpg");
background-size:cover;
}
#boxed
{   
    text-decoration:none;
	border: 4px outset #ccc;
	padding:10px;
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
<!-- text in box to write this space-->
<div style="float: right;">
        	<div><img src="image/index.jpg"" style="width: 820px"></div><br>
        	
        </div>
<div>
  <div  style="color:#2b2d31">
    <div align="left">
<h3>
<br/>
    &nbsp;&nbsp;&nbsp;<a id="boxed" href="viwrooms.jsp">Rooms Reports&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><br/><br/><br/>
    &nbsp;&nbsp;&nbsp;<a id="boxed" href="viwfloors.jsp" >Floor Reports&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><br/><br/><br/>
    &nbsp;&nbsp;&nbsp;<a id="boxed" href="viwBlocks.jsp">Block Reports&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><br/><br/><br/>
    &nbsp;&nbsp;&nbsp;<a id="boxed" href="viwseats.jsp">Seat Reports&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><br/><br/><br/>
    &nbsp;&nbsp;&nbsp;<a id="boxed" href="viwstudents.jsp">Student Reports&nbsp;&nbsp;&nbsp;</a><br/><br/><br/>
    &nbsp;&nbsp;&nbsp;<a id="boxed" href="viwassings.jsp">Assing Seat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
</h3>
</div>
</div>
</div>

        	
        </div>

<div id="box3">
</div>
    </body>
</html>