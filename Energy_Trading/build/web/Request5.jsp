<%-- 
    Document   : Request5
    Created on : 19 Mar, 2025, 5:03:19 PM 
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
            String CR_Id=request.getParameter("CR_Id");
            Dbconnection db1=new Dbconnection();
            String query="update energy_trading.consumer_register set Admin_Sts='Approved' where CR_Id='"+CR_Id+"'";
            int i=db1.update(query);
            if(i>0)
            {
                session.setAttribute("msg", "Approved Sucessfully!!");
                response.sendRedirect("Consumer_Approve.jsp");
            }
        %>
    </body>
</html>
