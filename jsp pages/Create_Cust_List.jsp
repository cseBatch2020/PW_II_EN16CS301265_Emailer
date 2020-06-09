<%--
    Document   : Customer_List
    Created on : 29 Jan, 2020, 11:05:18 AM
    Author     : admin
--%>

<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileWriter"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!--*************************TOP PART**************************-->
<!DOCTYPE html>
<html lang="en">
 
<!-- Mirrored from minetheme.com/Endless1.5.1/table.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 15 Dec 2015 10:13:06 GMT -->
<head>
    <meta charset="utf-8">
    <title>Template Creator</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome-->
<link href="css/font-awesome.min.css" rel="stylesheet">

<!-- Pace -->
<link href="css/pace.css" rel="stylesheet">

<!-- Datatable -->
<link href="css/jquery.dataTables_themeroller.css" rel="stylesheet">

<!-- Endless -->
<link href="css/endless.min.css" rel="stylesheet">
<link href="css/endless-skin.css" rel="stylesheet">
        <style>
            #sub2{
                display: block;
            }
        </style>
  </head>  
     
  <body class="overflow-hidden">
<!-- Overlay Div -->
    <jsp:include page="Sidebar.jsp"/>
    <br>  
         <div id="main-container">
                        <div class="panel panel-default" style="padding: 20px;margin: 20px">
                            
                            <%
    String UPLOAD_DIRECTORY = "C://java projects//HTMLTask//src//main//webapp//customerfiles//";
if(request.getParameter("mydata").equals("cl"))
{
%>

                                <form method="post" action="Create_Cust_List.jsp?mydata=enterData" >
                                    <div class="panel-heading">
                                        CREATE CUSTOMER LIST
                                    </div>
                                    <div class="panel-body">
                                        <fieldset class="form-horizontal form-border">
                                        <div class="form-group">
                                            <label class="control-label col-lg-2">Name of List</label>
                                            <div class="col-lg-8">
                                                <input name="txtList" placeholder="Enter List Name" type="text" style="width: auto;" class="form-control input-sm bounceIn animation-delay2 col-lg-9" required >
                                            </div><!-- /.col -->
                                            <div class="col-lg-2"></div>
                                        </div>
                                        <center><button type="submit" class="btn btn-success btn-sm" style="width: 100px;">Add</button></center>
                                          </fieldset>
                                    </div>
                                </form>
<%}
else if(request.getParameter("mydata").equals("enterData"))
{  

 
     String ListName=request.getParameter("txtList");
    session.setAttribute("ListName",ListName);
     File f=new File(UPLOAD_DIRECTORY+ListName+".csv");
     if(!f.exists())
     {
         f.createNewFile();
BufferedReader reader = new BufferedReader(new FileReader(UPLOAD_DIRECTORY+ListName+".csv"));
String line;

if((line = reader.readLine())== null)
{
FileWriter fw = new FileWriter(UPLOAD_DIRECTORY+ListName+".csv",true);

fw.append("Name");
fw.append(',');
fw.append("Email");

fw.append('\n');
fw.flush();
fw.close();


     }
%>
<form method="post" action="editcust.jsp">
<table class="table table-striped" id="dataTable">
							
								  <tbody>
                           <tr>                                                                    
 
                               <th><center><b><input type="hidden" name="txtList" value="<%=ListName%>"  ></b></center></th><th><center><b><input type="submit" value="OK"></b></center></th>
            </tr>
</tbody>
</table>
</form>


<%}  }%>
<!--//else if(request.getParameter("mydata").equals("ed2"))
//{
// String ListName=session.getAttribute("ListName").toString();
//File ff=new File(UPLOAD_DIRECTORY+ListName+".csv");
////FileInputStream fis = new FileInputStream(UPLOAD_DIRECTORY+ListName+".csv");
////  DataInputStream myInput = new DataInputStream(fis);
//BufferedReader reader = new BufferedReader(new FileReader(UPLOAD_DIRECTORY+ListName+".csv"));
//String line;
//
//if((line = reader.readLine())== null)
//{
//FileWriter fw = new FileWriter(UPLOAD_DIRECTORY+ListName+".csv",true);
//
//fw.append("Name");
//fw.append(',');
//fw.append("Email");
//
//fw.append('\n');
//fw.flush();
//fw.close();
//}
//FileWriter fw = new FileWriter(UPLOAD_DIRECTORY+ListName+".csv",true);
//
//fw.append(request.getParameter("newname"));
//fw.append(',');
//fw.append(request.getParameter("newemail"));
//
//fw.append('\n');
//fw.flush();
//fw.close();
//}-->

<!--***********************TABLE**********************-->

            </div><!-- /wrapper id -->
     </div>
<!--*************************MIDDLE PART**************************-->

<!--*************************BOTTOM PART**************************-->
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

<!-- Jquery -->
<script src="js/jquery-1.10.2.min.js"></script>

<!-- Bootstrap -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
 
<!-- Datatable -->
<script src='js/jquery.dataTables.min.js'></script>

<!-- Modernizr -->
<script src='js/modernizr.min.js'></script>

<!-- Pace -->
<script src='js/pace.min.js'></script>

<!-- Popup Overlay -->
<script src='js/jquery.popupoverlay.min.js'></script>

<!-- Slimscroll -->
<script src='js/jquery.slimscroll.min.js'></script>

<!-- Cookie -->
<script src='js/jquery.cookie.min.js'></script>

<!-- Endless -->
<script src="js/endless/endless.js"></script>

<script>
$(function() {
$('#dataTable').dataTable( {
"bJQueryUI": true,
"sPaginationType": "full_numbers"
});

$('#chk-all').click(function() {
if($(this).is(':checked')) {
$('#responsiveTable').find('.chk-row').each(function() {
$(this).prop('checked', true);
$(this).parent().parent().parent().addClass('selected');
});
}
else {
$('#responsiveTable').find('.chk-row').each(function() {
$(this).prop('checked' , false);
$(this).parent().parent().parent().removeClass('selected');
});
}
});
});
$('#temp1 i').removeClass('fa-caret-square-o-right');
$('#temp1 i').addClass('fa-caret-square-o-down');
</script>

  </body>

</html>
