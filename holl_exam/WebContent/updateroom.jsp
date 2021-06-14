<%@page import="com.exam.room.RoomBean"%>
<%@page import="com.exam.room.RoomDao" %>

 
<% 
  if(request.getMethod().equalsIgnoreCase("post"))
  {
	  %>
	  <jsp:useBean id="bean" class="com.exam.room.RoomBean"></jsp:useBean>
	  <jsp:setProperty property="*" name="bean"/>
	  <% 
	  if(new RoomDao().updateroom(bean))
	  {
		  response.sendRedirect("viwrooms.jsp");
	  }
  }
%>
<%@page import="com.exam.utility.utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
<title>Update Room</title>
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
  String room_id=request.getParameter("room_id");
 RoomBean bb=new RoomDao().getRoom(room_id);    
   if(bb!=null){
  %>

  <h1>Update Room</h1>
  <form action="updateroom.jsp" method="post" >
 <input type="hidden" name="room_id" value="<%=room_id%>">
   <label for="room_name">Room Name<span>*</span></label>
 <input value="<%=bb.getRoom_name() %>" type="text" name="room_name" size="40" required>
 <br/>
 <br/>
   
            <label for="room_floor_id">Select Floor<span>*</span></label>
          <select style="height: 30px; width:318px" name = "room_floor_id"  required>
          <option value="<%=bb.getRoom_floor_id()%>"><%=bb.getRoom_floor_id()%></option> 
            <%
              for(String floor:utility.getroom_floor_id()){
            	  if(!bb.getRoom_floor_id().equalsIgnoreCase(floor)){  
            	  %>
            	   
            	  <option value="<%=floor%>"><%=floor %></option>
            	   <%
            	  }
            
             }
             %>
             </select>
 
 <br/>
 <br/>
             <label for="room_user_id">Supervisor<span>*</span></label>
          <select style="height:30px; width:319px "  name = "room_user_id" required>
           <option value="<%=bb.getRoom_user_id()%>"><%=bb.getRoom_user_id()%></option> 
           <%
              for(String Super:utility.getroom_user_id()){
            	  if(!bb.getRoom_user_id().equalsIgnoreCase(Super)){
            	  %>
            	   
            	  <option value="<%=Super%>"><%=Super %></option>
            	   <%
            	  }
             }
             %> 
</select>
             
<br/>
<br/>      
       
<div>
            <label for="room_description">Description<span></span></label>
			  &nbsp;&nbsp;<textarea value="<%=bb.getRoom_description() %>" style="width:318px; height:60px;" name="room_description" ></textarea>
          </div>
          <br/>
          <br/> 
 <div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="submit"  type="submit" value="Update Room ">
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
	 <h1 align="center" style="color:red">Please Select Room First<a href="viwrooms.jsp"><b style="color:blue;">Click Here</b></a></h1>
  <%   
   }
%>
</div>


    </body>
</html>
