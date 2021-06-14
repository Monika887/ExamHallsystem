<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.exam.student.StudentBean"%>
<%@page import="com.exam.student.StudentDao" %>
<%@page import="com.exam.utility.utility"%>

 <%
  if(request.getMethod().equalsIgnoreCase("post"))
  {
	  %>
	  <jsp:useBean id="bean" class="com.exam.student.StudentBean"></jsp:useBean>
	  <jsp:setProperty property="*" name="bean"/>
	  <%
	  if (new StudentDao().addStudent(bean))
	  {
		response.sendRedirect("viwstudents.jsp");  
	  }
  }
%>
<!DOCTYPE html>
<html>
    <head>
<title>Students Add</title>
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
<div align="center">


  <h1>Student Entry Form</h1>
  <form  action="addstudent.jsp" method="post">
  
 <label for="name">Name<span>*</span></label>
 <input  style="width:310px; height:25px;" type="text" name="student_name" size="30" required>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
 <label for="student_rollno">Roll Number<span>*</span></label>
 <input style="width:310px; height:25px;"  type="text" name="student_rollno"  size="30" required>
<br/>
<br/>
  <label for="student_father_name">Father Name<span>*</span></label>
 <input  style="width:310px; height:25px" type="text" name="student_father_name" size="30" required>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <label for="student_dob">Date of Birth<span>*</span></label>
 <input  style="width:310px; height:25px;" type="text" name="student_dob" size="30" required>
 <br/>
 <br/>
  <label for="student_mobail">Mobail<span>*</span></label>
 <input  style="width:310px; height:25px;" type="text" name="student_mobail" size="30" required>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;
   
            <label for="student_course_id">Course<span>*</span></label>
          <select style="height: 30px; width:318px" name = "student_course_id"  required>
              <%
              for(String course:utility.getstudent_course_id()){
            	  %>
            	   
            	  <option value="<%=course%>"><%=course %></option>
            	   <%
              
            
             }
             %> </select>
 <br/>
 <br/>
           
<br/>
<br/>             
<div>
            <label for="student_details">Other Details<span>*</span></label>
			  &nbsp;&nbsp;
			  <textarea  style="width:310px; height:50px;" name="student_details" required></textarea>
          </div>
          <br/>
          <br/> 
 <div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input  type="submit" value="Save Detail">
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