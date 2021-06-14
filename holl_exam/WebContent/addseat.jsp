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
	  if (new SeatDao().addSeat(bean))
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

<div id="box2" style="background: url(image/main_1.jpg);
     background-size:cover; ">

<div align="center">

  <h1>Seat Entry Form</h1>
  <form method="post" action="addseat.jsp">
  
 <label for="seat_number">Seat Number<span>*</span></label>
 <input style="width:310px; height:25px;"  type="text" name="seat_number" size="40" required>
 <br/>
 <br/>
             
              <label for="seate_block_id">Seat Block<span>*</span></label>
             <select style="width:310px; height:25px;"  name = "seate_block_id" required>
             <%
              for(String block:utility.getseate_block_id()){
            	  %>
            	   
            	  <option value="<%=block%>"><%=block %></option>
            	   <%
             }
             %>
             </select>
             <br/>
             <br/>
<div>
            <label for="seat_description">Description<span>*</span></label>
			  &nbsp;&nbsp;<textarea style="width:310px; height:50px;"  name="seat_description" required></textarea>
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
</div>


    </body>
</html>