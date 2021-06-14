<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.exam.seat.*"%>
<%@page import="com.exam.utility.utility"%>

<%

  if(request.getMethod().equalsIgnoreCase("post"))
  {
	  %>
	  <jsp:useBean id="bean" class="com.exam.seat.SeatBean"></jsp:useBean>
	  <jsp:setProperty property="*" name="bean"/>
	  <%
	  if (new SeatDao().updateSeat(bean))
	  {
		response.sendRedirect("viwseats.jsp");  
	  }
  }
%>

<!DOCTYPE html>
<html>
    <head>
<title>Seat Add</title>
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

<div id="box2">

<div align="center">
<%
String seat_id=request.getParameter("seat_id");
SeatBean bb=new SeatDao().getSeat(seat_id);
if(bb!=null){
%>
  <h1>Seat Entry Form</h1>
  <form action="updateseat.jsp" method="post">
  <input type="hidden" name="seat_id" value="<%=seat_id%>">
 <label for="seat_number">Seat Number<span>*</span></label>
 <input  value="<%=bb.getSeat_id() %>" type="text" name="seat_number" size="40" required>
 <br/>
 <br/>
             
              <label for="seate_block_id">Seat Block<span>*</span></label>
             <select style="height: 30px; width:318px" name = "seate_block_id" required>
             <option  value="<%=bb.getSeate_block_id() %>"><%=bb.getSeate_block_id() %></option>
             <%
              for(String block:utility.getseate_block_id()){
            	  if(!bb.getSeate_block_id().equalsIgnoreCase(block)){
            	  %>
            	   
            	  <option value="<%=block%>"><%=block %></option>
            	  <%
            	  }
              }
            	  %>
             </select>
             <br/>
             <br/>
<div>
            <label for="seat_description">Description<span>*</span></label>
			  &nbsp;&nbsp;<textarea  value="<%=bb.getSeat_description() %>" style="width:318px; height:60px;" name="seat_description" required></textarea>
          </div>
          <br/>
          <br/> 
 <div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="submit" type="submit" value="Save seat">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input name="reset" type="reset" value="Reset Form">
			
 </div>
<br/>
<br/>
</form>
</div>
<%   
   } else{
	   %>
	 <h1 align="center" style="color:red">Please Select Block First<a href="viwseats.jsp"><b style="color:blue;">Click Here</b></a></h1>
  <%   
   }
%>

</div>
    </body>
</html>