<%@page import="com.exam.utility.utility"%>
<%@page import="com.exam.assing.AssingDao"%>
<%@page import="com.exam.assing.AssingBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
  if(request.getMethod().equalsIgnoreCase("post"))
  {
	  %>
	  <jsp:useBean id="bean" class="com.exam.assing.AssingBean"></jsp:useBean>
	  <jsp:setProperty property="*" name="bean"/>
	  <%
	  if (new AssingDao().addAssing(bean))
	  {
		response.sendRedirect("viwassings.jsp");  
	  }
  }
%>
<!DOCTYPE html>
<html>
    <head>
<title>Assing Seat</title>
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
<!-- text in box to write this space-->
<div align="center"  >

  <h1>StudentSeat Entry Form</h1>
 <form  action="addassing.jsp" method="post">
         <h2><label for="ss_student_id">Select Roll Number<span>*</span></label>
             <select  style="height: 40px; width:300px"   required >
             <% 
              for(String room:utility.getBlock_room_id()){
            	  %>
            	  <option value="<%=room%>"><%=room %></option>
            	   <%
               }
              %>  
             </select>
 <br/>
 <br/>
             <label style="padding-left:7%" for="ss_seat_id">Select Seat<span>*</span></label>
          <select style="height: 40px; width:300px"  name = "ss_seat_id"  required>
              <%
              for(String room:utility.getss_seat_id()){
            	  %>
            	   
            	  <option value="<%=room%>"><%=room %></option>
            	   <%
              
            
             }
             %>
             </select> </h2>
  
          <div> <h2><label style="padding-left:5%;" for="ss_description">Description<span>*</span></label>
			  &nbsp;&nbsp;<textarea  style="height: 50px; width:300px" name="ss_description" required></textarea>
           </h2> </div>
         <br/>
          <div style="padding-left:15%"> <input name="submit" type="submit" value="Save StudentSeat">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input name="reset" type="reset" value="Reset Form"></div>
	

<br/>
<br/>

</form>

</div>
</div>

    </body>
</html>