<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="com.exam.student_seat.StudentseatD"%>
<%@page import="com.exam.student_seat.StudentseatB"%>
<%@page import="com.exam.seat.SeatDao" %>
<%@page import="com.exam.seat.SeatBean" %>
<%@page import="com.exam.student.StudentBean" %>
<%@page import="com.exam.student.StudentDao" %>
<%
    
    StudentseatD seatDetails = new StudentseatD();
	String student_roll = request.getParameter("student_roll");
	StudentseatB Values =new StudentseatB();
%>
	   <div class="wrapper row3">
  <div class="rounded">
    <main> 
      <div class="scrollae"> 
      
        <h2>Student Seat Assign Card</h2>
        <table>
          <thead>
            <tr>
              <th>Roll Number</th>
			 	  <td><% out.print(Values.get("Student_rollno")); %></td>
            </tr>
			<tr>
              <th>Name</th>
			  <td><% out.print(Values.get("Student_name")); %></td>
            </tr>
			<tr>
              <th>Father Name</th>
			  <td><% out.print(Values.get("Student_father_name")); %></td>
            </tr>
			<tr>
             <th>Seat Number</th>
			  <td><% out.print(Values.get("seat_number")); %></td>
            </tr>
			<tr>
              
              
              <th>Block Number</th>
			  <td><% out.print(Values.get("block_name")); %></td>
            </tr>
			<tr>
              <th>Room Number</th>
			  <td><% out.print(Values.get("room_name")); %></td>
            </tr>
			<tr>
              <th>Floor</th>
			  <td><% out.print(Values.get("floor_name")); %></td>
            </tr> 
           
          </thead>
        </table>
		<div style="float:left;">
			<input name="submit" type="button" value="Print Card" style="background-color:#4d0b0d; padding:10px 15px; font-weight:bold; color:#ffffff" onClick="window.print()">
		</div>
		
	
		
        </div>
    </main>
  </div>
</div>