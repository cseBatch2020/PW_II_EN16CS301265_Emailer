<%-- 
    Document   : Unzip.jsp
    Created on : Aug 23, 2019, 10:20:32 AM
    Author     : Divya Chhabra
--%>

<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="FileDAO.UnzipUtility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="FileDAO.FolderShow1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unzip</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% 
         
        String fileNames=(request.getParameter("fileNames"));
        String zipFilePath = "E://FileUpload//HTMLTask//src//main//webapp//templatefiles//"+fileNames;
        String destDirectory = "E://FileUpload//HTMLTask//src//main//webapp//templatefiles//";
        UnzipUtility unzipper = new UnzipUtility();  
        
        try {
            unzipper.unzip(zipFilePath, destDirectory);
            out.print("File is Unzipped"); 
            response.sendRedirect("ViewFileFolder.jsp");
           } catch (IOException ex) 
        {
           ex.printStackTrace();
        }
        %>
    </body>
</html>
