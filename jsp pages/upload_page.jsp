<%@page import="org.apache.commons.io.FileUtils"%>
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
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
    <!--<title>Template Creator</title>-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Font Awesome -->
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
	
	<!-- Endless -->
	<link href="css/endless.min.css" rel="stylesheet">
	<link href="css/endless-skin.css" rel="stylesheet">
        <style>
            #sub{
                display: block;
            }
        </style>
  </head>

  <body class="overflow-hidden"> 
	<!-- Overlay Div -->
	<jsp:include page="Sidebar.jsp"/>
        
<!--*************************MIDDLE PART**************************-->			
		<!--****************FORM***************-->
                <div id="main-container">
                    <br>
                    <div class="panel panel-default" style="padding: 20px;margin: 20px">
                    <%
                        if(!request.getParameter("mydata").equals("view")){
                    %>
                        <form method="post" action="UploadServlet" enctype="multipart/form-data">   
               		<div class="panel-heading">
                            UPLOAD TEMPLATES
			</div>
			<div class="panel-body">
                            <fieldset class="form-horizontal form-border">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <label class="control-label col-lg-2">Choose Template File</label>
                                    <div class="col-lg-9">                        
                                        <div class="upload-file">                                                                                       
                                            <input name="file_uploaded" size="30" type="file" id="upload-demo" class="upload-demo" required="">
                                            <label data-title="Select file" for="upload-demo">
                                                <span data-title="No file selected..." ></span>
                                            </label>
                                        </div>
                                    </div><!-- /.col -->
                                    <div class="col-lg-1"></div>
                                </div><br><br><br>
                                <div class="col-md-12">
                                    <label class="control-label col-lg-2">Template File Name</label>
                                    <input type="text" name="txtTemp" placeholder="Enter File Name" style="width: auto;margin-left: 15px" class="form-control input-sm bounceIn animation-delay2 col-lg-9" required>
                                    <div class="col-lg-1"></div>
                                </div>
                            </div><!-- /form-group -->
                            
                            <center><button type="submit" class="btn btn-success btn-sm" style="width: 100px;">Upload</button></center>
                            </fieldset>			
			</div><!-- /panel body -->
                        </form>
                    <!-- /panel -->
                    <% }
                        else if(request.getParameter("mydata").equals("view")){
                    %>
                    <div class="row">
                        <div class="col-md-12" style="padding-left: 40px;padding-right: 40px">
                            <div class="panel panel-default table-responsive">
                                <div class="panel-heading">
                                    UPLOADED TEMPLATES
                                </div>               
<!--      <div id="dataTable_length" class="dataTables_length"><label>&nbsp;&nbsp; Show <select class="form-control input-sm inline-block" size="1" style="width:100px; height:25px ;padding: 2px" name="dataTable_length" aria-controls="dataTable"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div>
      <div class="dataTables_filter" id="dataTable_filter"><label> <div class="input-group pull-right" style="width:150px; height: 25px; padding: 1px"><input type="text" class="form-control input-sm" placeholder="Search here..." aria-controls="dataTable"><span class="input-group-btn"><button class="btn btn-default btn-sm" type="button"><i class="fa fa-search"></i></button></span></div></label></div>	-->
                                <div class="padding-md clearfix">
                                    <table class="table table-striped" id="dataTable">
					<thead>
                                        <tbody>
                                            <tr>
                                                <th><center><b>Folder Name</b></center></th><th><center><b>File Name</b></center></th><th><center><b>Action</b></center></th><th><th><center><b>Sent Status</b></center></th><center><b></b></center></th>
                                            </tr>

       <%
           try{
       String file = application.getRealPath("/templatefiles");
       File f = new File(file);
       int i;
       String [] fileNames = f.list();
       File [] fileObjects= f.listFiles();
       //request.getAttribute("message");
//       out.print("<h1>"+request.getAttribute("message")+"</h1>");
//       out.print("<h1>"+request.getAttribute("nae")+"</h1>");
       String[] extensions = new String[] {"html"};
      
       %>
      
       <%
       for ( i = 0; i < fileObjects.length; i++) {
       if(fileObjects[i].isDirectory())
       {   
           //out.print("<h1>"+fileObjects[i]+"</h1>");
        File dir=fileObjects[i];
        List<File> files = (List<File>) FileUtils.listFiles(dir, extensions, true);
       %>
   
       <tr>
           <!--<td  style="text-align: center"><b></b></td>-->
               <% for (File file1 : files)
         {
             out.print("<td  style='text-align: center'><b>"+fileNames[i]+"</b></td>");
             out.print("<td  style='text-align: center'>"+file1.getName()+"</td>");
         %>

           <td style="text-align: center"> 
               <a href="deletefile.jsp?fileNames=<%=fileNames[i]%>">
                   <button type="submit" title="Delete File" class="fa fa-trash-o fa-lg"></button>
               </a>
               <a href="edit.jsp?fileNames=<%=fileNames[i]%>">
               <button type="submit" title="Edit File" class="fa fa-edit fa-lg"></button>
                   </a>
          <a href="send_mail.jsp?fileNames=<%=fileNames[i]%>">
               <button type="submit" title="Send Mail" class="fa fa-share fa-lg"></button>
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
     <% }
     %>
     </div>
    </div>
	<!--*************************BOTTOM PART**************************-->


    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	
	
	<script src="js/jquery-1.10.2.min.js"></script>
	
	<!-- Bootstrap -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
    
	<!-- Chosen -->
	<script src='js/chosen.jquery.min.js'></script>	

	<!-- Mask-input -->
	<script src='js/jquery.maskedinput.min.js'></script>	

	<!-- Datepicker -->
	<script src='js/bootstrap-datepicker.min.js'></script>	

	<!-- Timepicker -->
	<script src='js/bootstrap-timepicker.min.js'></script>	
	
	<!-- Slider -->
	<script src='js/bootstrap-slider.min.js'></script>	
	
	<!-- Tag input -->
	<script src='js/jquery.tagsinput.min.js'></script>	

	<!-- WYSIHTML5 -->
	<script src='js/wysihtml5-0.3.0.min.js'></script>	
	<script src='js/uncompressed/bootstrap-wysihtml5.js'></script>	

	<!-- Dropzone -->
	<script src='js/dropzone.min.js'></script>	
	
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
	<script src="js/endless/endless_form.js"></script>
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
                $(document).ready(function() {
                    // Setup - add a text input to each footer cell
                    $('#example thead tr').clone(true).appendTo( '#example thead' );
                    $('#example thead tr:eq(1) th').each( function (i) {
                        var title = $(this).text();
                        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );

                        $( 'input', this ).on( 'keyup change', function () {
                            if ( table.column(i).search() !== this.value ) {
                                table
                                    .column(i)
                                    .search( this.value )
                                    .draw();
                            }
                        } );
                    } );

                    var table = $('#example').DataTable( {
                        orderCellsTop: true,
                        fixedHeader: true
                    } );
                } );
                $('#temp i').removeClass('fa-caret-square-o-right');
                $('#temp i').addClass('fa-caret-square-o-down');
	</script>
	
  </body>

<!-- Mirrored from minetheme.com/Endless1.5.1/table.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 15 Dec 2015 10:13:08 GMT -->
</html>