
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
#boxes
{   
    text-decoration:none;
	border: 4px outset #ccc;
	padding:5px;
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
<div style="float: right;"><img src="image/index.jpg"" style="width: 820px"></div>
<div align="left" style="padding-left:25px">
<h3>
    <a id="boxes" href="viwrooms.jsp">Rooms Reports&nbsp;&nbsp;&nbsp;</a><br/><br/>
    <a id="boxes" href="viwfloors.jsp" >Floor Reports&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><br/><br/>
    <a id="boxes" href="viwBlocks.jsp">Block Reports&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><br/><br/>
    <a id="boxes" href="viwseats.jsp">Seat Reports&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><br/><br/>
    <a id="boxes" href="viwstudents.jsp">Student Reports&nbsp;&nbsp;</a><br/><br/>
    <a id="boxes" href="Assing Seat.jsp">Assing Seat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><br/><br/>
    <a id="boxes" href="userR.jsp">User Reports&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><br/><br/>
    <a id="boxes" href="change password.jsp">Change Password</a><br/><br/>
    <a id="boxes" href="login.jsp">Logout&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
 </h3> 
</div>
</div>
<div id="box3">

</div>
    </body>
</html>