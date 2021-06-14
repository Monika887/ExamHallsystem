<%
session=request.getSession(false);
if(session!=null){
	String admin=(String) session.getAttribute("admin");
    if(admin!=null){
    	session.removeAttribute("admin");
    }
}
response.sendRedirect("login.jsp");
%>
