<%-- 
    Document   : send_mail1
    Created on : Sep 21, 2019, 2:35:35 PM
    Author     : abc
--%>

<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="FileDAO.send_email_gmail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sending Mail</title>
    </head>
    <body>
        <%
                 String dv1=(request.getParameter("dv"));
                 String sub=(request.getParameter("Subject"));
                 String Ut =request.getParameter("SelectD");   
                 String User[] = Ut.split("\n");
                 String path="//templatefiles//"+dv1;
                 String jspPath = session.getServletContext().getRealPath(path);
                 String txtFilePath = jspPath+ "/beefree-c7ixeljatn.html";
//            out.print(txtFilePath);
//            out.print(User[0]);
                 if(User != null)
     {       // out.print(User[i]);
            send_email_gmail seg= new send_email_gmail();
            BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
            StringBuilder sb = new StringBuilder();
            String sb1=null;
            String line;

            while((line = reader.readLine())!= null)
            {
                sb.append(line+"\n");
            }
              sb1=sb.toString();
          
             // out.print(sb1);
             seg.mail_sending(User,sb1,sub);
//
   }
   
          response.sendRedirect("Home.jsp");
%>
<script>
$(function() {
//----- OPEN
$('[data-popup-open]').on('click', function(e) {
var targeted_popup_class = jQuery(this).attr('data-popup-open');
$('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);

e.preventDefault();
});

//----- CLOSE
$('[data-popup-close]').on('click', function(e) {
var targeted_popup_class = jQuery(this).attr('data-popup-close');
$('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);

e.preventDefault();
});
});
</script>
    </body>
</html>
