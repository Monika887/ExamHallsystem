 <%@page import="com.exam.assing.AssingBean"%>
<%@page import="com.exam.assing.AssingDao"%>
<%@page import="com.exam.block.Blockss"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exam.block.BlockDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
<title>Assing Seat Report</title>
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
AssingDao dao = new AssingDao();
String student_seat=request.getParameter("student_seat");
if(student_seat!=null){
dao.deleteAssing(student_seat);}
ArrayList<AssingBean> al = dao.getAllAssing();
if(al != null)
  {	
  %>
     <div>
	  <table  border="3px" width="100%" cellspacing="1px" cellpadding="3px">
	    <tr>
	        <th>student name</th>
	         <th>Roll Number</th>
	         <th>Block Name</th>
	         <th>Description</th>
	         <th colspan="3">Adit</th>
	         <tr>
        
        </tr>
       
     	
     	<%
     	   for(AssingBean bean : al)
     	   {
     		   %>
     		   <tr>
     		
     		<td><%=bean.getSs_seat_id() %></td>
     		<td><%=bean.getSs_student_id() %></td>
     		<td><%=bean.getSs_seat_id() %></td>
     		<td><%=bean.getSs_description() %></td>
     		<td>
     		<div align="center">
     		<a id="A" href=updateassing.jsp?student_seat=<%=bean.getStudent_seat() %>>Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     		<a id="A" href=viwassings.jsp?student_seat=<%=bean.getStudent_seat()%>>Delete</a>
     		</div>
     		</td>
     		</tr>
     		   <%
     	   }
     	%>
	</table>
  </div>
	<%
}else{
	%>
	<h1 style="color: red">There is no data in database table!!!</h1>
	<% 
}
%>
 </div>
</body>
</html>