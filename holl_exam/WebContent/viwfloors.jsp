<%@page import="com.exam.floor.floorBean"%>
<%@page import="com.exam.floor.floorDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html> 
    <head>
<title>floor Report</title>
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
 floorDao dao=new floorDao();
String floor_id=request.getParameter("floor_id");
if(floor_id!=null){
	dao.deletefloor(floor_id);
}
ArrayList<floorBean> al = dao.getAllfloor();
if(al!=null)
  {	
  %>
	  <table border="3px" width="100%" cellspacing="1px" cellpadding="3px">
	    <tr>
	        
	       
	         <th>floor Name</th>
	         <th>Description</th>
	         <th colspan="3">Action</th>
     	</tr>
     	<%
     	  
     	   for(floorBean bean:al)
     	   {
     		   %>
     		   <tr>
     		
     		
     		<td><%=bean.getFloor_name() %></td>
     		<td><%=bean.getFloor_description() %></td>
     		<td>
     		<div align="center">
     		<a id="A" href=updatefloor.jsp?floor_id=<%=bean.getFloor_id() %>>Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     		<a id="A" href=viwfloors.jsp?floor_id=<%=bean.getFloor_id()%>>Delete</a>
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