<%@page import="com.exam.block.Blockss"%>
<%@page import="com.exam.block.*" %>
<%

  if(request.getMethod().equalsIgnoreCase("post"))
  {
	  %>
	  <jsp:useBean id="bean" class="com.exam.block.Blockss"></jsp:useBean>
	  <jsp:setProperty property="*" name="bean"/>
	  <%
	  if (new BlockDao().updateBlock(bean))
	  {
		response.sendRedirect("viwBlocks.jsp");  
	  }
  }
%>
<%@page import="com.exam.utility.utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
<title>Update Block</title>
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
  String block_id=request.getParameter("block_id");
  Blockss bb=new BlockDao().getBlock(block_id);    
   if(bb!=null){
  %>
  <h1>Update Block</h1>
  
  <form action="updateBlock.jsp" method="post"> 
  <input type="hidden" name="block_id" value="<%=block_id%>">
            <label for="email">Select Room<span>*</span></label>
          <select style="height: 30px; width:318px"  name = "block_room_id"  required> 
               <option value="<%=bb.getBlock_room_id()%>"><%=bb.getBlock_room_id()%></option>      
             <%
              for(String room:utility.getBlock_room_id()){
            	  if(!bb.getBlock_room_id().equalsIgnoreCase(room)){
            		  
            	 
            	  %>
            	   
            	  <option value="<%=room%>"><%=room %></option>
            	   <%
               }
            
             }
             %>
             </select>
  <br/>
 <br/>           
 <label for="block_name">Block Name<span>*</span></label>
 <input value="<%=bb.getBlock_name() %>"  type="text" name="block_name" size="40" required>
 <br/>
 <br/>             
             
 
<div>
            <label for="block_description">Description<span>*</span></label>
			  &nbsp;&nbsp;<textarea value="<%=bb.getBlock_description() %>" style="width:318px; height:60px;"  name="block_description" required></textarea>
          </div>
          <br/>
          <br/> 
 <div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="submit" type="submit"  value="Update Block">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input  name="reset" type="reset" value="Reset Form">
			
 </div>
<br/>
<br/>
</form>
</div>
<%   
   } else{
	   %>
	 <h1 align="center" style="color:red">Please Select Block First<a href="viwBlocks.jsp"><b style="color:blue;">Click Here</b></a></h1>
  <%   
   }
%>

</div>
    </body>
</html>