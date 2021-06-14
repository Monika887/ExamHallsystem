<%@page import="java.util.ArrayList"%>
<%@page import="com.exam.student.StudentBean"%>
<%@page import="com.exam.student.StudentDao" %>
<%@page import="com.exam.utility.utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
<title>Student Report</title>
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
StudentDao dao=new StudentDao();
String students_id=request.getParameter("students_id");
if(students_id !=null){
	dao.deletestudent(students_id);
}
ArrayList<StudentBean> al = dao.getAllStudent();
if(al != null)
  {	
  %>
     <div>
	  <table  border="3px" width="100%" cellspacing="1px" cellpadding="3px">
	    <tr>
	        
	         <th>Student id</th>
	         <th>Roll Number</th>
	         <th>Name</th>
	         <th>Father Name</th>
	         <th>Mobile</th>
	         <th>Date Of Birth</th>
	         <th colspan="3">Action</th>
	         <tr>
        
        </tr>
        <% 	   	
     	   for(StudentBean bean : al)
     	    {   
     		  %>
     	
     	<tr>
     	<td><%=bean.getStudents_id() %></td>
     	<td><%=bean.getStudent_rollno() %></td>
     	<td><%=bean.getStudent_name() %></td>
     	<td><%=bean.getStudent_father_name() %></td>
     	<td><%=bean.getStudent_mobail() %></td>
     	<td><%=bean.getStudent_dob() %></td>
     	<td>
     		<div align="center">
     		<a id="A" href=updatestudent.jsp?students_id=<%=bean.getStudents_id() %>>Edit</a>
     		<a id="A" href=viwstudents.jsp?students_id=<%=bean.getStudents_id() %>>Delete</a>
     		</div>
     		</td>
     	</tr>
     	<%} %>
     
	</table>
  </div>
	<%
}else{
	%>
	<h1 style="color: red">There is no data in database table!!!</h1>
	<% 
}

%>
 </div>
</body>
</html>