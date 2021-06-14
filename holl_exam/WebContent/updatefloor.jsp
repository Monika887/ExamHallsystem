<%@page import="com.exam.floor.*"%>
<%@page import="com.exam.floor.floorBean" %>
<%

  if(request.getMethod().equalsIgnoreCase("post"))
  {
	  %>
	  <jsp:useBean id="bean" class="com.exam.floor.floorBean"></jsp:useBean>
	  <jsp:setProperty property="*" name="bean"/>
	  <%
	  if (new floorDao().updatefloor(bean))
	  {
		response.sendRedirect("viwfloors.jsp");  
	  }
  }
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
<title>update floor</title>
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
<!-- text in box to write this space-->

<div style="width: 50%; margin-left: 25%; margin-top: 5% ">
  <%
  String floor_id=request.getParameter("floor_id");
  floorBean bb=new floorDao().getfloor(floor_id);    
   if(bb!=null){
  %>
  <h1>Update Floor</h1>
  
  <form action="updatefloor.jsp" method="post">
  <input type="hidden" name="floor_id" value="<%=floor_id%>">

   
            
             
 <label for="block_name">Floor Name<span>*</span></label>
 <input value="<%=bb.getFloor_name() %>"  type="text" name="floor_name" size="40" required>
 <br/>
 <br/>             
             
 
<div>
            <label for="floor_description">Description<span>*</span></label>
			  &nbsp;&nbsp;<textarea value="<%=bb.getFloor_description()%>" style="width:318px; height:60px;"  name="floor_description" required></textarea>
          </div>
          <br/>
          <br/> 
 <div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input  type="submit" value="Update Floor">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input  name="reset" type="reset" value="Reset Form">
			
 </div>
<br/>
<br/>
</form>


<%   
   }else{
	   %>
	 <h1 style="color:red">Please Select Floor First<a href="viwfloors.jsp"><b style="color:blue;">Click Here</b></a></h1>
	   <%
   }
%>
</div>
</div>
    </body>
</html>