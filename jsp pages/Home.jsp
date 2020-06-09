<%-- 
    Document   : index
    Created on : Aug 26, 2019, 3:32:40 PM
    Author     : Divya Chhabra
--%>

<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
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
 
  </head>   
     
  <body class="overflow-hidden">
	<!-- Overlay Div -->
	<jsp:include page="Sidebar.jsp"/>
         <div id="main-container">
                        <div class="row">
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
                      <th><center><b>Folder Name</b></center></th><th><center><b>File Name</b></center></th><th><center><b>Status</b></center></th><th><th><center><b>SEND</b></center></th><center><b></b></center></th>
                    </tr>

       <%
           try{
       String file = application.getRealPath("/templatefiles");
       File f = new File(file);
       int i;
       String [] fileNames = f.list();
       File [] fileObjects= f.listFiles();
       String[] extensions = new String[] {"html"};
      
       %>
      
       <%
       for ( i = 0; i < fileObjects.length; i++) {
       if(fileObjects[i].isDirectory())
       {   
        File dir=fileObjects[i];
        List<File> files = (List<File>) FileUtils.listFiles(dir, extensions, true);
       %>
   
       <tr><td  style="text-align: center"><b><%=fileNames[i]%></b></td>
               <% for (File file1 : files)
         {
             out.print("<td  style='text-align: center'>"+file1.getName()+"</td>");
         %>

           <td style="text-align: center"> 
               <a href="deletefile.jsp?fileNames=<%=fileNames[i]%>">
                   <button type="submit" class="fa fa-trash-o fa-lg"></button>
               </a>
               <a href="edit.jsp?fileNames=<%=fileNames[i]%>">
               <button type="submit" class="fa fa-edit fa-lg"></button>
               </a>
              <a href="send_mail.jsp?fileNames=<%=fileNames[i]%>">
               <button type="submit" class="fa fa-share fa-lg"></button>
               </a>
           </td>
       </tr>
       
<% } } }}catch(Exception e)
{
 e.printStackTrace();
}%>
     </tbody>
                                                </table>
                </div><!-- /main container -->
		<!--cl-md-6-->
		<!--row-->
	<!--***********************TABLE**********************-->
	
	</div><!-- /wrapper id -->
       </div>
      </div>
     </div>
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
		$(function()	{
			$('#dataTable').dataTable( {
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
	</script>
	
  </body>

</html>
