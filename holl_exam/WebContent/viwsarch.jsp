<%@page import="java.beans.beancontext.BeanContext"%>
<%@page import="com.exam.room.*"%>
<%@page import="com.exam.seat.SeatDao"%>
<%@page import="com.exam.seat.SeatBean"%>
<%@page import="com.exam.seat.SeatDao" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
<title>Sarch Report</title>
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

SeatDao bean=new SeatDao();

String seat_id=request.getParameter("seat_id");
if(seat_id!=null){
	bean.deleteSeat(seat_id);
}
ArrayList<SeatBean> al = bean.getAllSeat();
if(al != null)
  {	
  %>
     <div>
	  <table  border="3px" width="100%" cellspacing="1px" cellpadding="3px">
	    <tr>
	        
	         <th>Seat id</th>
	         <th>Seat Number</th>
	         <th>Block Name</th>
	         <th>Description</th>
	         <th colspan="3">Adit</th>
	         <tr>
        
        </tr>
     	  <% 	   	
     	   for(SeatBean  bean2 : al)
     	    {   
     		  %>
     	
     	<tr>
     	<td><%=bean2.getSeat_id() %></td>
     	<td><%=bean2.getSeat_number() %></td>
     	<td><%=bean2.getSeate_block_id() %></td>
     	<td><%=bean2.getSeat_description() %></td>
     	<td>
     		<div align="center">
     		<a id="A" href=updateseat.jsp?seat_id=<%=bean2.getSeat_id() %>>Edit</a>
     		<a id="A" href=viwseats.jsp?seat_id=<%=bean2.getSeat_id() %>>Delete</a>
     		</div>
     		</td>
     	</tr>
     	
     <%} %>
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