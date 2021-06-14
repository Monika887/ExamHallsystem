<%@page import="com.exam.room.RoomBean"%>
<%@page import="com.exam.room.RoomDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.exam.utility.utility"%>
 <% 
  if(request.getMethod().equalsIgnoreCase("post"))
  {
	  %>
	  <jsp:useBean id="bean" class="com.exam.room.RoomBean"></jsp:useBean>
	  <jsp:setProperty property="*" name="bean"/>
	  <% 
	  if(new RoomDao().addroom(bean))
	  {
		  response.sendRedirect("viwrooms.jsp");
	  }
  }
%>


<!DOCTYPE html>
<html>
    <head>
<title>Room Add</title>
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
  <h1>Room Entry Form</h1>
  <form action="addroom.jsp" method="post" >
 
 <label for="room_name">Room Name<span>*</span></label>
 <input type="text" name="room_name" size="40" required>
 <br/>
 <br/>
   
            <label for="room_floor_id">Select Floor<span>*</span></label>
          <select style="height: 30px; width:318px" name = "room_floor_id"  required>
            <%
              for(String floor:utility.getroom_floor_id()){
            	  %>
            	   
            	  <option value="<%=floor%>"><%=floor %></option>
            	   <%
              
            
             }
             %>
             </select>
 
 <br/>
 <br/>
            &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<label for="room_user_id"> Teacher<span>*</span></label>
          <select style="height:30px; width:319px "  name = "room_user_id" id = "room_user_id" required>
           <%
              for(String Super:utility.getroom_user_id()){
            	  %>
            	   
            	  <option value="<%=Super%>"><%=Super %></option>
            	   <%
             }
             %> 
</select>
             
<br/>
<br/>      
       
<div>
            <label for="room_description">Description</label>
			  &nbsp;&nbsp;<textarea style="width:318px; height:60px;" name="room_description" ></textarea>
          </div>
          <br/>
          <br/> 
 <div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input  type="submit" value="Save Room ">
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
	 