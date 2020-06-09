<%-- 
    Document   : test
    Created on : Aug 23, 2019, 12:47:00 PM
    Author     : Divya Chhabra
--%>

<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.io.File"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="database.Db_Connection"%>
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

	<!-- Chosen -->
	<link href="css/chosen/chosen.min.css" rel="stylesheet"/>

	<!-- Datepicker -->
	<link href="css/datepicker.css" rel="stylesheet"/>
	
	<!-- Timepicker -->
	<link href="css/bootstrap-timepicker.css" rel="stylesheet"/>
	
	<!-- Slider -->
	<link href="css/slider.css" rel="stylesheet"/>
	
	<!-- Tag input -->
	<link href="css/jquery.tagsinput.css" rel="stylesheet"/>

	<!-- WYSIHTML5 -->
	<link href="css/bootstrap-wysihtml5.css" rel="stylesheet"/>
	
	<!-- Dropzone -->
	<link href='css/dropzone/dropzone.css' rel="stylesheet"/>
	
	<!-- Datatable -->
	<link href="css/jquery.dataTables_themeroller.css" rel="stylesheet">
	
	<!-- Endless -->
	<link href="css/endless.min.css" rel="stylesheet">
	<link href="css/endless-skin.css" rel="stylesheet">
	
  </head>

  <body class="overflow-hidden">
	<!-- Overlay Div -->
	<jsp:include page="Sidebar.jsp"/>
        <!-- Main Table-->
        >
        <div id="main-container">
                        <div class="col-md-11" style="padding-left: 50px;">
				<div class="panel panel-default table-responsive">
					<div class="panel-heading">
						UPLOADED FILES
					</div>
                                    
                                    <div id="dataTable_length" class="dataTables_length"><label>&nbsp;&nbsp; Show <select class="form-control input-sm inline-block" size="1" style="width:100px; height:25px ;padding: 2px" name="dataTable_length" aria-controls="dataTable"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div>
				    <div class="dataTables_filter" id="dataTable_filter"><label> <div class="input-group pull-right" style="width:200px; height: 25px; padding: 1px"><input type="text" class="form-control input-sm" placeholder="Search here..." aria-controls="dataTable"><span class="input-group-btn"><button class="btn btn-default btn-sm" type="button"><i class="fa fa-search"></i></button></span></div></label></div>	
                                    
                                    <div class="padding-md clearfix">
						<table class="table table-striped" id="dataTable">
							<thead>
								  <tbody>
                                                                      <tr>
                      <td><center><b>File</b></center></td>
                    </tr>
                    <tr>
        <%
        File folder = new File("C://java projects//HTMLTask//src//main//webapp//templatefiles//");

        File[] files = folder.listFiles();
 
        for (File file : files)
        {
           if (file.isFile())
            {
             out.println("<br/>");
             out.println("<td>");
             out.println(file.getName());
             out.println("</td>");
             out.println("</tr>");
            
            }
            else if (file.isDirectory())
            {
               out.println("<tr>"); 
               out.println("<td>");
               out.println(file.getName());
               out.println("</td>");
                out.println("</tr>");
               for (String arr : file.list())
              {
                out.println("<tr>"); 
                out.println("<td>");
                out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); 
                out.print("**"+arr);
                out.println("</td>");
                out.println("</tr>");
            
              }
            
        }}
        %>
                        
          </tbody>
                                                </table>
                </div><!-- /main container -->
                <div class="padding-md clearfix">
						<table class="table table-striped" id="dataTable2">
							<thead>
								  <tbody>
                                                                      <tr>
                      <td><center><b>File</b></center></td>
                    </tr>
                    <tr>
        <%
        File custfolder = new File("C://java projects//HTMLTask//src//main//webapp//customerfiles//");

        File[] custfiles = custfolder.listFiles();
 
        for (File file1 : custfiles)
        {
           if (file1.isFile())
            {
             out.println("<br/>");
             out.println("<td>");
             out.println(file1.getName());
             out.println("</td>");
             out.println("</tr>");
            
            }
            else if (file1.isDirectory())
            {
               out.println("<tr>"); 
               out.println("<td>");
               out.println(file1.getName());
               out.println("</td>");
                out.println("</tr>");
               for (String arr : file1.list())
              {
                out.println("<tr>"); 
                out.println("<td>");
                out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); 
                out.print("**"+arr);
                out.println("</td>");
                out.println("</tr>");
            
              }
            
        }}
        %>
                        
          </tbody>
                                                </table>
                </div>
		<!--cl-md-6-->
		<!--row-->
	<!--***********************TABLE**********************-->
	
        </div>
        <div class="panel-body">
            <center><a href="Home.jsp"><button type="submit" class="btn btn-success btn-sm" style="width: 100px;">Go to Home</button></a></center>
        </div>
        </div><!-- /wrapper id -->
       </div>
          </center>
      </div>
    
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
		$(function	()	{
			$('#dataTable').dataTable( {
				"bJQueryUI": true,
				"sPaginationType": "full_numbers"
			});
                        $('#dataTable2').dataTable( {
				"bJQueryUI": true,
				"sPaginationType": "full_numbers"
			});
			
			$('#chk-all').click(function()	{
				if($(this).is(':checked'))	{
					$('#responsiveTable').find('.chk-row').each(function()	{
						$(this).prop('checked', true);
						$(this).parent().parent().parent().addClass('selected');
					});
				}
				else	{
					$('#responsiveTable').find('.chk-row').each(function()	{
						$(this).prop('checked' , false);
						$(this).parent().parent().parent().removeClass('selected');
					});
				}
			});
		});
                $(#dataTable_length).removeClass("dataTable_length");
                $(#dataTable_filter).removeClass("dataTable_filter");
	</script>
	
  </body>

<!-- Mirrored from minetheme.com/Endless1.5.1/table.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 15 Dec 2015 10:13:08 GMT -->
</html>
    </body>
</html>
