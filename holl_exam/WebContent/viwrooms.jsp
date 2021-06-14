<%@page import="com.exam.room.RoomBean"%>
<%@page import="com.exam.room.RoomDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Room Report</title>
<link href="css/second.css" type="text/css" rel="stylesheet"/>
<link href="css/color.css" type="text/css" rel="stylesheet"/>
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

<div id="box2" id="B">
<%  
 RoomDao dao=new RoomDao();
String room_id=request.getParameter("room_id");
if(room_id!=null)
{
	dao.deleteroom(room_id);
}
ArrayList<RoomBean> all = dao.getAllroom();
if(all!=null)
  {	
  %>
	  <table border="3px" width="100%" cellspacing="1px" cellpadding="3px">
	    <tr>
	         <th>Room Name</th>
	          <th>floor Name</th>
	          <th>Supervisor</th>
	          
	         
	         <th colspan="3">Action</th>
     	</tr>
     	
     	<%
     	  
     	   for(RoomBean bean : all)
     	   {
     		   %>
     		   <tr>
     		<td><%=bean.getRoom_name() %></td>
     		<td><%=bean.getRoom_floor_id() %></td>
     		<td><%=bean.getRoom_user_id() %></td>
     		
     		
     		<td>
     		<div align="center">
     		<a id="A" href=updateroom.jsp?room_id=<%=bean.getRoom_id() %>>Edit</a> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
     		<a id="A" href=viwrooms.jsp?room_id=<%=bean.getRoom_id() %>>Delete</a>
     		</div>
     		</td>
     		   </tr>
     		   <%
     	   }
     	%>
	</table>
	<%
}else{
	%>
	<h1 style="color:red">There is no data in database table!!!</h1>
	<% 
}
%>
 </div>
</body>
</html>
