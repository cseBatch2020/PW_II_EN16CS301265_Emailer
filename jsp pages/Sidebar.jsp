<%-- 
    Document   : Sidebar
    Created on : 1 Feb, 2020, 12:35:22 PM
    Author     : admin
--%>

<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    <title>Hvantage Emailer</title>
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
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
    </head>
    <body>
        <div id="overlay" class="transparent"></div>

	<a href="#" id="theme-setting-icon"><i class="fa fa-cog fa-lg"></i></a>
	<div id="theme-setting">
		<div class="title">
			<strong class="no-margin">Skin Color</strong>
		</div>
		<div class="theme-box">
			<a class="theme-color" style="background:#323447" id="default"></a>
			<a class="theme-color" style="background:#efefef" id="skin-1"></a>
			<a class="theme-color" style="background:#a93922" id="skin-2"></a>
			<a class="theme-color" style="background:#3e6b96" id="skin-3"></a>
			<a class="theme-color" style="background:#635247" id="skin-4"></a>
			<a class="theme-color" style="background:#3a3a3a" id="skin-5"></a>
			<a class="theme-color" style="background:#495B6C" id="skin-6"></a>
		</div>
		<div class="title">
			<strong class="no-margin">Sidebar Menu</strong>
		</div>
		<div class="theme-box">
			<label class="label-checkbox">
				<input type="checkbox" checked id="fixedSidebar">
				<span class="custom-checkbox"></span>
				Fixed Sidebar
			</label>
		</div>
	</div><!-- /theme-setting -->
	
	<div id="wrapper" class="preload">
		<div id="top-nav" class="skin-6 fixed">
			<div class="brand">
			<a href="Home.jsp">	
                            <span style="color: white">Emailer</span>
                        </a>
			</div><!-- /brand -->
			<button type="button" class="navbar-toggle pull-left" id="sidebarToggle">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<button type="button" class="navbar-toggle pull-left hide-menu" id="menuToggle">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			
		</div><!-- /top-nav-->
		
		<aside class="fixed skin-6">			
			<div class="sidebar-inner scrollable-sidebar">
				<div class="size-toggle">
					<a class="btn btn-sm" id="sizeToggle">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					<a class="btn btn-sm pull-right logoutConfirm_open"  href="logout.jsp">
						<i class="fa fa-power-off"></i>
					</a>
				</div><!-- /size-toggle -->	
				<div class="user-block clearfix">
                                    <a href="Home.jsp"><img src="email.png" style="height: 50px; width: 75px;">
					<div class="detail" style="margin: 0">
                                            <p style="size: 100px;"><br><strong>EMAILER<br></strong></p>
					</div>
                                    </a>
				</div><!-- /user-block -->
<!--				<div class="search-block">
					<div class="input-group">
						<input type="text" class="form-control input-sm" placeholder="search here...">
						<span class="input-group-btn">
							<button class="btn btn-default btn-sm" type="button"><i class="fa fa-search"></i></button>
						</span>
					</div> /input-group -->
				<!--</div> /search-block -->
 
				<div class="main-menu">
					<ul>
                                            <li class="openable">
                                                <a href="#" class="temp" id="temp">
                                                                <span class="menu-icon" >
                                                                    <i class="fa fa-caret-square-o-right" style="font-size: 1.2em"></i> 
								</span>
								<span class="text">
									Manage Template
								</span>
								<span class="menu-hover"></span>
							</a>
                                                <ul class="submenu" id="sub">
								<li class="list">
                                                                    <a href="createTemplate.jsp">
                                                                            <span class="menu-icon">
                                                                                    <i class="fa fa-plus-circle fa-lg"></i> 
                                                                            </span>&nbsp;
                                                                            <span class="submenu-label">
                                                                                    Create Template
                                                                            </span>
                                                                            <span class="menu-hover"></span>
                                                                    </a>
                                                                </li>
								<li class="list">
                                                                        <a href="upload_page.jsp?mydata=upd">
                                                                                <span class="menu-icon">
                                                                                        <i class="fa fa-upload fa-lg"></i> 
                                                                                </span>&nbsp;
                                                                                <span class="submenu-label">
                                                                                        Upload Template
                                                                                </span>
                                                                                <span class="menu-hover"></span>
                                                                        </a>
                                                                </li>
								<li class="list">
                                                                        <a href="upload_page.jsp?mydata=view">
                                                                                <span class="menu-icon">
                                                                                        <i class="fa fa-folder-open fa-lg"></i> 
                                                                                </span>&nbsp;
                                                                                <span class="submenu-label">
                                                                                        View Template List
                                                                                </span>
                                                                                <span class="menu-hover"></span>
                                                                        </a>
                                                                </li>
							</ul>
						</li>
                                            <li class="openable">
                                                        <a href="#" class="temp" id="temp1">
                                                                <span class="menu-icon" >
                                                                    <i class="fa fa-caret-square-o-right" style="font-size: 1.2em"></i> 
								</span>
								<span class="text">
									Manage Customer List
								</span>
								<span class="menu-hover"></span>
							</a>
                                                <ul class="submenu" id="sub2">
								<li class="list">
                                                                    <a href="Create_Cust_List.jsp?mydata=cl">
                                                                            <span class="menu-icon">
                                                                                    <i class="fa fa-plus-circle fa-lg"></i> 
                                                                            </span>&nbsp;
                                                                            <span class="submenu-label">
                                                                                    Create List
                                                                            </span>
                                                                            <span class="menu-hover"></span>
                                                                    </a>
                                                                </li>
								<li class="list">
                                                                        <a href="Customer_List.jsp?mydata=cc">
                                                                                <span class="menu-icon">
                                                                                        <i class="fa fa-upload fa-lg"></i> 
                                                                                </span>&nbsp;
                                                                                <span class="submenu-label">
                                                                                        Upload List
                                                                                </span>
                                                                                <span class="menu-hover"></span>
                                                                        </a>
                                                                </li>
								<li class="list">
                                                                        <a href="Customer_List.jsp?mydata=vc">
                                                                                <span class="menu-icon">
                                                                                        <i class="fa fa-folder-open fa-lg"></i> 
                                                                                </span>&nbsp;
                                                                                <span class="submenu-label">
                                                                                        View Customer List
                                                                                </span>
                                                                                <span class="menu-hover"></span>
                                                                        </a>
                                                                </li>
							</ul>
						</li>
                                                <li class="openable">
                                                        <a href="#" class="temp" id="temp2">
                                                                <span class="menu-icon" >
                                                                    <i class="fa fa-caret-square-o-right" style="font-size: 1.2em"></i> 
								</span>
								<span class="text">
									Manage Spreadsheet
								</span>
								<span class="menu-hover"></span>
							</a>
                                                <ul class="submenu" id="sub3">
								<li class="list">
                                                                    <a href="importSheet.jsp">
                                                                            <span class="menu-icon">
                                                                                    <i class="fa fa-cloud-download"></i> 
                                                                            </span>&nbsp;
                                                                            <span class="submenu-label">
                                                                                    Import Sheet
                                                                            </span>
                                                                            <span class="menu-hover"></span>
                                                                    </a>
                                                                </li>
								<li class="list">
                                                                        <a href="#">
                                                                                <span class="menu-icon">
                                                                                        <i class="fa fa-cloud-upload"></i> 
                                                                                </span>&nbsp;
                                                                                <span class="submenu-label">
                                                                                        Export Template
                                                                                </span>
                                                                                <span class="menu-hover"></span>
                                                                        </a>
                                                                </li>
							</ul>
                                                </li>
                                                
<!--						<li class="openable">
							<a href="#">
								<span class="menu-icon">
									<i class="fa fa-edit fa-lg"></i> 
								</span>
								<span class="text">
									Edit Template
								</span>
								<span class="menu-hover"></span>
							</a>
							<ul class="submenu">
								<li><a href="template1.html"><span class="submenu-label">Template 1</span></a></li>
								<li><a href="template2.html"><span class="submenu-label">Template 2</span></a></li>
								<li><a href="template3.html"><span class="submenu-label">Template 3</span></a></li>
								<li><a href="template4.html"><span class="submenu-label">Template 4</span></a></li>
								<li><a href="template5.html"><span class="submenu-label">Template 5</span></a></li>
								<li><a href="template6.html"><span class="submenu-label">Template 6</span></a></li>
							</ul>
						</li>-->
                                                
<!--						<li>
							<a href="ViewFileFolder.jsp">
								<span class="menu-icon">
									<i class="fa fa-folder-open fa-lg"></i> 
								</span>
								<span class="text">
									View Directory
								</span>
								<span class="menu-hover"></span>
							</a>
						</li>-->
                                                <li>
							<a href="#">
								<span class="menu-icon">
									<i class="fa fa-envelope fa-lg" style="font-size: 1.1em"></i> 
								</span>
								<span class="text" style="margin-left: 9px">
									Send Mail
								</span>
								<span class="menu-hover"></span>
							</a>
						</li>
                                                <li>
							<a class="logoutConfirm_open" href="logout.jsp">
								<span class="menu-icon">
									<i class="fa fa-sign-out fa-lg" style="font-size: 1.3em"></i> 
								</span>
								<span class="text" style="margin-left: 7px">
									Log-out
								</span>
								<span class="menu-hover"></span>
							</a>
						</li>
                                        </ul>
						
				</div><!-- /main-menu -->
			</div><!-- /sidebar-inner scrollable-sidebar -->
		</aside>

		<a href="#" id="scroll-to-top" class="hidden-print"><i class="fa fa-chevron-up"></i></a>
	
	<!-- Logout confirmation -->
	<div class="custom-popup width-100" id="logoutConfirm">
		<div class="padding-md">
			<h4 class="m-top-none"> Are you sure you want to exit?</h4>
		</div>

		<div class="text-center">
			<a class="btn btn-success m-right-sm" href="logout.jsp">Logout</a>
			<a class="btn btn-danger logoutConfirm_close">Cancel</a>
		</div>
	</div>
    </body>
    <script type="text/javascript">
        $('.temp').click(function(){
            $(this).find('i').toggleClass('fa-caret-square-o-right fa-caret-square-o-down');
        });
    </script>
</html>
