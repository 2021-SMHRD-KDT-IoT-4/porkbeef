<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
		<title>Login</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.dropotron.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-wide.css" />
		</noscript>
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
<body>
	<div class="wrapper style1">
				<!-- Page -->
		<div id="page" class="container">
			<form action="Login.do" method="post">
				<input type="text" name ="id" placeholder="ID를 입력하세요">
				<input type="password" name ="pw" placeholder="PW를 입력하세요">
				<input type="submit" value="LogIn" class="button fit">
				<div style="height: 30px"></div>
				<input type="button" value="Join" class="button fit"
				onClick="location.href='Join.jsp'">
			</form>
		</div>
	</div>
<div class="wrapper style1"></div>
<div class="wrapper style1"></div>
<div class="wrapper style1"></div>
	
</body>
</html>