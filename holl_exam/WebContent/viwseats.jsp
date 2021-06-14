
<%@page import="com.exam.room.RoomBean"%>
<%@page import="com.exam.room.RoomDao"%>
<%@page import="com.exam.floor.floorDao"%>
<%@page import="com.exam.floor.floorBean"%>
<%@page import="com.exam.seat.SeatDao"%>
<%@page import="com.exam.seat.SeatBean"%>
<%@page import="com.exam.seat.SeatDao" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
<title>Seat Report</title>
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
 RoomDao daoa=new RoomDao();
String room_name=request.getParameter("room_name");
ArrayList<RoomBean> all = daoa.getAllroom();
if(all!=null)
  {	
	%>
  }
<%  
 floorDao daoo=new floorDao();
String floor_name=request.getParameter("floor_name");
ArrayList<floorBean> ala = daoo.getAllfloor();
if(ala!=null)
  {	
  %>
<%  
SeatDao dao=new SeatDao();
String seat_id=request.getParameter("seat_id");
if(seat_id!=null){
	dao.deleteSeat(seat_id);
}
ArrayList<SeatBean> al = dao.getAllSeat();
if(al != null)
  {	
  %>
     <div>
	  <table  border="3px" width="100%" cellspacing="1px" cellpadding="3px">
	    <tr>
	        
	         <th>Seat id</th>
	         <th>Seat Number</th>
	         <th>Block Name</th>
	         <th>Room Name</th>
	         <th>Floor Name</th>
	         <th>Description</th>
	         <th colspan="3">Adit</th>
	         <tr>
        
        </tr>
       
     	<%
     	  for(SeatBean bean:al)
     	  {	  
     	%>
     	<%
     	   for(floorBean kean : ala )
     	   {  
     	   %>
     	  <%
     	   for(RoomBean sean : all)
     	   {
     		   %>
     	<tr>
     	<td><%=bean.getSeat_id() %></td>
     	<td><%=bean.getSeat_number() %></td>
     	<td><%=bean.getSeate_block_id() %></td>
     	<td><%=sean.getRoom_name() %></td>
     	<td><%=kean.getFloor_name() %></td>
     	<td><%=bean.getSeat_description() %></td>
     	<td>
     		<div align="center">
     		<a id="A" href=updateseat.jsp?seat_id=<%=bean.getSeat_id() %>>Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     		<a id="A" href=viwseats.jsp?seat_id=<%=bean.getSeat_id() %>>Delete</a>
     		</div>
     		</td>
     	</tr>
     	<% 
     	break;
     	   }break;
     	  }
     	break;
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
}	
}
%>
 </div>
</body>
</html>