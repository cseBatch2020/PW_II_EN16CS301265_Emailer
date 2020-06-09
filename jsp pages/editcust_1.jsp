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
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <script src="ckeditor/ckeditor.js"></script>
    <title>Template Creator</title>
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
	
       
	
  </head>

  <body class="overflow-hidden"> 
	<!-- Overlay Div -->
	<jsp:include page="Sidebar.jsp"/>
        <div id="main-container">
            <div class="panel panel-default">
            <div class="panel-heading">
                <%
             try{
            String fileNames=(request.getParameter("fileNames"));
            %>
            <div class="panel-heading">
                <center><h3 style="color: black"><%=fileNames%></h3></center>
            </div>
            <%
             }
             catch(Exception e)
            {
                out.print(e);
              e.printStackTrace();
              //response.sendRedirect("login_page.html");
            }
             %>
             
            </div>
            <br/>
<!--            <h1>BKCCCCCCCCCCCCC</h1>-->

         <form method="post" action="editcust.jsp">
             
             <div class="row">
		<div class="col-md-11" style="padding-left: 50px;">
				<div class="panel panel-default table-responsive">
					             
      <!--<div id="dataTable_length" class="dataTables_length"><label>&nbsp;&nbsp; Show <select class="form-control input-sm inline-block" size="1" style="width:100px; height:25px ;padding: 2px" name="dataTable_length" aria-controls="dataTable"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div>-->
      	
                                    <div class="padding-md clearfix">
             <table class="table table-striped" id="dataTable">
							<thead>
								  <tbody>
                                                                      
  
     
                                                
         <%
             try{
                 
       
                String fileNames=(request.getParameter("fileNames"));
//                 out.print("<center><h1>"+fileNames+"</h1></center>");
                
            
//             if(!request.getParameter("fileNames").equals(null))
//            {
            String path="//customerfiles//"+fileNames;
            String jspPath = session.getServletContext().getRealPath(path);
            String txtFilePath = jspPath;
            //out.print(fileNames+"             ");
//            out.print(jspPath+"            ");
//            out.print(txtFilePath+"                   ");
%>
<tr>
                        
    <input type="hidden" name="fileNames" value="<%=fileNames%>">
             <th><center><b>Name <input type="text" name="newname" style=" opacity: 1 !important"  >&nbsp;&nbsp;&nbsp;&nbsp;</b></center></th><th><center><b>Email <input type="text" name="newemail" style=" opacity: 1 !important"  >&nbsp;&nbsp;</b></center></th><th><center><b><input type="submit" value="ADD"></b></center></th>
  
                    </tr>
                                                                      
                                                                      
                    <tr>
                        
                        <th><center><b>Name</b></center></th><th><center><b>Email</b></center></th><th><center><b> <input type="checkbox" style=" opacity: 1 !important"  name='selectAllCheck' onClick='javascript:funcSelectAll()' value='Select All'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select All </input> </b></center></th><th><center><b>SEND</b></center></th>
                    </tr>

         <%
            File sFile = new File(txtFilePath);
            if(sFile.exists())
            {
//                out.print("foundddddddddddd");
                BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
            StringBuilder sb = new StringBuilder();
            String line;
           int k=0;
            while((line = reader.readLine())!= null)
            {
                if(k==0)
                {
                    k++;
                    continue;
                }
                k++;
                    
              String s1[] = line.split(",");
            
            
            
           
//                sb.append(line+"\n");
//                out.print("<h1>");
//            out.print(s1[5]);
//            out.print("</h1>");
            %>
            <tr><td  style="text-align: center"><%=s1[0]%><b></b></td>
            <td  style='text-align: center'><%=s1[1]%></td>
            
            
              <td style='text-align: center'>   &nbsp;&nbsp;<input type="checkbox" style=" opacity: 1 !important" value="" name='lang'> </td>
            </tr>
            <%
              
            }
if(!request.getParameter("newname").equals(null)&&!request.getParameter("newemail").equals(null))
{
File ff=new File(txtFilePath);

FileWriter fw = new FileWriter(txtFilePath,true);

fw.append(request.getParameter("newname"));
fw.append(',');
fw.append(request.getParameter("newemail"));

fw.append('\n');
fw.flush();
fw.close();

    %>
    <tr><td  style="text-align: center"><%=request.getParameter("newname").toString()%><b></b></td>
        <td  style='text-align: center'><%=request.getParameter("newemail").toString()%></td>
        <td style='text-align: center'>   &nbsp;&nbsp;<input type="checkbox" style=" opacity: 1 !important" value="" name='lang'> </td>
    </tr>
    <%
   
}
}

            %>
            
           
<!--//            out.print("<h1>");
//            out.print(sb.toString());
//            out.print("</h1>");
            
    
<!--<table class="table table-striped" id="dataTable">
							<thead>
								  <tbody>
                    <tr>
                      <th><center><b>Name</b></center></th><th><center><b>Email</b></center></th><th><center><b>Action</b></center></th><th><th><center><b>SEND</b></center></th><center><b></b></center></th>
                    </tr>-->

  
     </tbody>
     
                                                </table>

</div><!-- /wrapper id -->
       </div>
      </div>
             </div>
<%  
            
    

                 
//            out.print(new FileReader(txtFilePath));
            
    }catch(Exception e)
{
//    out.print(e+"SSSSSSSSSSSSS");
  e.printStackTrace();
  //response.sendRedirect("login_page.html");
}
             
%>
<br>
<center><button type="submit" class="btn btn-success btn-sm" style="width: 100px;">Save</button></center>
<br>
   
        
 </form>
</div>
        </div>
        
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
	</script>
        <script language="javascript">
function funcSelectAll()
{
   if(document.forms[0].selectAllCheck.checked==true)
   {
            for (var a=0; a < document.forms[0].lang.length; a++)        {
                 document.forms[0].lang[a].checked = true;            
           }
     }
     else
     {
           for (var a=0; a < document.forms[0].lang.length; a++)        {
                  document.forms[0].lang[a].checked = false;          
           }
     }          

}

</script>
	
  </body>

<!-- Mirrored from minetheme.com/Endless1.5.1/table.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 15 Dec 2015 10:13:08 GMT -->
</html>
        