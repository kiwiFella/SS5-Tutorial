<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
	<% base_tag %>
	<meta charset="utf-8" />
	<title>$Title - SilverStripe Tutorial</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	<!-- IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
	<![endif]-->
	
	<link href="http://fonts.googleapis.com/css?family=Raleway:300,500,900%7COpen+Sans:400,700,400italic" rel="stylesheet" type="text/css" />
	
	<% require themedCSS('bootstrap.min') %>
	<% require themedCSS('style') %>
	<% require themedJavascript('modernizr-2.8.1.min') %>
</head>
<body>
	<div id="wrapper">
	
		<% include Header %>
		
		$Layout
		
		<% include Footer %>
	
	</div>


<% require themedJavascript('common/jquery-1.11.1.min') %>
<% require themedJavascript('common/bootstrap.min') %>
<% require themedJavascript('common/bootstrap-datepicker') %>
<% require themedJavascript('common/chosen.min') %>
<% require themedJavascript('common/bootstrap-checkbox') %>
<% require themedJavascript('common/nice-scroll') %>
<% require themedJavascript('common/jquery-browser') %>
<% require themedJavascript('scripts') %>


</body>
</html>