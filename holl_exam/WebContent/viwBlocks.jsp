
<%@page import="com.exam.floor.floorDao"%>
<%@page import="com.exam.floor.floorBean"%>
<%@page import="com.exam.block.Blockss"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exam.block.BlockDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
<title>Block Report</title>
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
floorDao daoo=new floorDao();
String floor_name=request.getParameter("floor_name");
if(floor_name!=null){
	daoo.deletefloor(floor_name);
}
ArrayList<floorBean> ala = daoo.getAllfloor();
if(ala!=null)
  {	
  %>
  
<%   
BlockDao dao = new BlockDao();
String block_id=request.getParameter("block_id");
if(block_id!=null){
dao.deleteBlock(block_id);}
ArrayList<Blockss> al = dao.getAllBlock();
if(al!=null)
{		
%>
  
     <div>
	  <table border="3px" width="100%" cellspacing="1px" cellpadding="3px">
	    <tr>
	        
	         <th>Block id</th>
	         <th>Room id</th>
	         <th>Block Name</th>
	         <th>Floor Name</th>
	         <th>Description</th>
	         <th colspan="3">Adit</th>
	         <tr>
        
        </tr>
     	      <%  
     	      for(int i=0;i<al.size();i++){
     	   for(Blockss bean : al)
     	    {
     		   %>   
     		   <% 	   	
     	   for(floorBean kean : ala)
     	    {   
     		  %>
     		
     		<tr>
     		<td><%=bean.getBlock_id() %></td>
     		<td><%=bean.getBlock_room_id() %></td>
 	    	<td><%=bean.getBlock_name() %></td>
          
 	    	<td><%=kean.getFloor_name()%></td>
 	    	<td><%=kean.getFloor_description()%></td>
 		    <td>
     		<div align="center">
     		<a id="A" href=updateBlock.jsp?block_id=<%=bean.getBlock_id()%>>Edit</a>
     		<a id="A" href=viwBlocks.jsp?block_id=<%=bean.getBlock_id()%>>Delete</a>
     		</div>
     		</td>
     		</tr>
   	        <% 
     	  
   	     break;  }break;
   	      } 
     	      } 
	     %>

          </table>
	        <%
             } else {
		    %>
			  <h1 style="color:red">There is no data in database table!!!</h1>
			<%
	     	     }
                 }
            %>
	
  </div>
 </div>
</body>
</html>