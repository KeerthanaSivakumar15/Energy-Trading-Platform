<%-- 
    Document   : Request4
    Created on : 12 Feb, 2025, 2:46:14 PM
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
            String UE_Id=request.getParameter("UE_Id");
            Dbconnection db1=new Dbconnection();
            String query="update energy_trading.upload_energy set Sts='Rejected' where UE_Id='"+UE_Id+"'";
            int i=db1.update(query);
            if(i>0)
            {
                session.setAttribute("msg", "Rejected Sucessfully!!");
                response.sendRedirect("Energy_Approve.jsp");
            }
        %>
    </body>
</html>
