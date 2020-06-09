<%-- 
    Document   : logout
    Created on : Sep 20, 2019, 9:42:36 AM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
         session.invalidate();
         response.sendRedirect("index.html");
        %>
    </body>
</html>
