<%-- 
    Document   : Request2
    Created on : 29 Aug, 2024, 9:59:27 AM
    Author     : trios
--%>

<%@page import="Connection.Dbconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String PR_Id=request.getParameter("PR_Id");
            Dbconnection db1=new Dbconnection();
            String query="update energy_trading.provider_register set Sts='Rejected' where PR_Id='"+PR_Id+"'";
            int i=db1.update(query);
            if(i>0)
            {
                session.setAttribute("msg", "Rejected Sucessfully!!");
                response.sendRedirect("Provider_Approve.jsp");
            }
        %>
    </body>
</html>
