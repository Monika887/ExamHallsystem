<%@page import="com.exam.block.Blockss"%>
<%@page import="com.exam.block.BlockDao" %>
<%@page import="com.exam.utility.utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
                   pageEncoding="ISO-8859-1"%> 
<%

  if(request.getMethod().equalsIgnoreCase("post"))
  {
	  %>
	  <jsp:useBean id="bean" class="com.exam.block.Blockss"></jsp:useBean>
	  <jsp:setProperty property="*" name="bean"/>
	  <%
	  if (new BlockDao().addBlock(bean))
	  {
		response.sendRedirect("viwBlocks.jsp");  
	  }
  }
%>
<!DOCTYPE html>
<html>
    <head>
<title>Block Add</title>
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
     background-size:cover ">


<div style="width: 50%; margin-left: 25%; margin-top: 5% ">
  <h1>Block Entry Form</h1>
  <form action="addBlock.jsp" method="post">
  

   
            <label for="Select Room">Select Room<span>*</span></label>
          <select style="width:310px; height:25px;" name = "block_room_id"  required>
             
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
 <label for="block_name">Block Name<span>*</span></label>
 <input style="width:310px; height:25px;" type="text" name="block_name" size="40" required>
 <br/>
 <br/>             
<div>
            <label for="block_description">Description</label>
			  &nbsp;&nbsp;<textarea style="width:318px; height:60px;" name="block_description" ></textarea>
          </div>
          <br/>
          <br/> 
 <div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input  type="submit" value="Submit Block">
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