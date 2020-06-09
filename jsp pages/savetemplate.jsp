<%-- 
    Document   : savetemplate.jsp
    Created on : Sep 12, 2019, 4:04:10 PM
    Author     : Divya Chhabra
--%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
       <body>
         <%
             try{
             String text = request.getParameter("editor1");
             out.println(text);
             String fileNames=(request.getParameter("fileNames"));
             String path="\\templatefiles\\"+"test";
             out.println(path);
             String jspPath = session.getServletContext().getRealPath(path);
             out.println(jspPath);
             String txtFilePath = jspPath+ "/index.html";
             out.println(txtFilePath);
            FileWriter filewriter = new FileWriter(txtFilePath, true);
            filewriter.write(text + "<BR><BR>");
            filewriter.close();
           //  response.sendRedirect("Home.jsp");
    }catch(Exception e)
{
  e.printStackTrace();
  //response.sendRedirect("login_page.html");
}
%>
</html>
