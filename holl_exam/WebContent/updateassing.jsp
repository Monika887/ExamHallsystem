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
	  if (new AssingDao().updateAssing(bean))
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

<div id="box2"  style="background:url(image/main 2.jpg);
     background-size:cover ">
<!-- text in box to write this space-->
<div align="center">
<%
  String student_seat=request.getParameter("student_seat");
 AssingBean bb=new AssingDao().getAssing(student_seat);    
   if(bb!=null){
  %>
  <h1>StudentSeat Entry Form</h1>
 <form  action="updateassing.jsp" method="post">
  <input type="hidden" name="student_seat" value="<%=student_seat%>">
 <br/>
 <br/>
   
            <label for="ss_student_id">Select Roll Number<span>*</span></label>
          <select style="height: 30px; width:318px" name = "ss_student_id"  required>
              <option value="<%=bb.getSs_student_id() %>"><%=bb.getSs_student_id()%></option>
              <%
              for(String room:utility.getBlock_room_id()){
            	  if(!bb.getSs_student_id().equalsIgnoreCase(room)){
            		  
            	  %>
            	   
            	  <option value="<%=room%>"><%=room %></option>
            	   <%
            	  }
            
             }
             %> </select>
 <br/>
 <br/>
             <label for="ss_seat_id">Select Seat<span>*</span></label>
          <select style="height:30px; width:319px "  name = "ss_seat_id"  required>
              <option value="<%=bb.getSs_seat_id() %>"><%=bb.getSs_seat_id() %></option>
              <%
              for(String room:utility.getBlock_room_id()){
            	  if(!bb.getSs_seat_id().equalsIgnoreCase(room)){
            		  
            	  %>
            	   
            	  <option value="<%=room%>"><%=room %></option>
            	   <%
              
            	  }
             }
             %>
             </select>
    <br/>
    <br/>             
    <div>
            <label for="ss_description">Description<span>*</span></label>
			  &nbsp;&nbsp;<textarea value="<%=bb.getSs_description() %>" style="width:318px; height:60px;" name="ss_description" required></textarea>
          </div>
          <br/>
          <br/> 
 <div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="submit" type="submit" value="Save StudentSeat">
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
	 <h1 align="center" style="color:red">Please Select Block First<a href="viwassings.jsp"><b style="color:blue;">Click Here</b></a></h1>
  <%   
   }
%>
</div>


    </body>
</html>