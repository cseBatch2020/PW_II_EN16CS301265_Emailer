<%-- 
    Document   : deletefile
    Created on : Aug 24, 2019, 4:07:31 PM
    Author     : Divya Chhabra
--%>

<%@page import="FileDAO.Utils"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String fileNames=(request.getParameter("fileNames"));
            String path="E://FileUpload//HTMLTask//src//main//webapp//templatefiles//"+fileNames;
            Utils ut=new Utils();
            File f=new File(path);
            ut.rmdir(f);
            response.sendRedirect("Home.jsp");
        %>
    </body>
</html>
