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
	  if (new StudentDao().updateStudent(bean))
	  {
		response.sendRedirect("viwstudents.jsp");  
	  }
  }
%>
<!DOCTYPE html>
<html>
    <head>
<title>home page</title>
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

<div id="box2" >
<!-- text in box to write this space-->
<div align="center">
<%
  String students_id=request.getParameter("students_id");
  StudentBean bb=new StudentDao().getStudent(students_id);    
   if(bb!=null){
  %>
  <h1>Update Student</h1>
  
  <form  action="updatestudent.jsp" method="post">
   <input type="hidden" name="students_id" value="<%=students_id%>">
 <label for="student_name">Name<span>*</span></label>
 <input value="<%=bb.getStudent_name() %>" type="text" name="student_name" size="30" required>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
 <label for="student_rollno">Roll Number<span>*</span></label>
 <input value="<%=bb.getStudent_rollno() %>" type="text" name="student_rollno"  size="30" required>
<br/>
<br/>
  <label for="student_father_name">Father Name<span>*</span></label>
 <input value="<%=bb.getStudent_father_name() %>" type="text" name="student_father_name" size="30" required>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <label for="student_dob">Date of Birth<span>*</span></label>
 <input value="<%=bb.getStudent_dob() %>" type="text" name="student_dob" size="30" required>
 <br/>
 <br/>
  <label for="student_mobail">Mobile<span>*</span></label>
 <input value="<%=bb.getStudent_mobail() %>" type="text" name="student_mobail" size="30" required>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;
   
            <label for="student_course_id">Course<span>*</span></label>
          <select style="height: 30px; width:318px" name = "student_course_id"  required>
              <option value="<%=bb.getStudent_course_id()%>" ><%=bb.getStudent_course_id()%></option>      
             <%
              for(String course:utility.getstudent_course_id()){
            	  if(!bb.getStudent_course_id().equalsIgnoreCase(course)){
            		  
            	 
            	  %>
            	   
            	  <option value="<%=course%>"><%=course %></option>
            	   <%
               }
            
             }
             %>
              </select>
 <br/>
 <br/>
           
<br/>
<br/>             
<div>
            <label for="student_details">Other Details<span>*</span></label>
			  &nbsp;&nbsp;<textarea value="<%=bb.getStudent_details() %>" style="width:318px; height:60px;" name="student_details" required></textarea>
          </div>
          <br/>
          <br/> 
 <div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="submit" type="submit" value="Save Detail">
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
	 <h1 align="center" style="color:red">Please Select Block First<a href="viwstudents.jsp"><b style="color:blue;">Click Here</b></a></h1>
  <%   
   }
%>
</div>
    </body>
</html>