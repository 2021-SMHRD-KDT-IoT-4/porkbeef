<%@page import="com.Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<!--
	Phase Shift by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Phase Shift by TEMPLATED</title>
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

</head>
<body>

	<%
	    MemberDTO user = (MemberDTO)session.getAttribute("user");
		
		if(user == null){
			response.sendRedirect("Login.jsp");
		}
	%>
	<!-- Wrapper -->
	<div class="wrapper style1">

		<!-- Header -->

		<div id="header" class="skel-panels-fixed">
			<div id="logo">
				<h1>
					<a href="index.html">소관리돼지</a>
				</h1>
			</div>
			<nav id="nav">
				<ul>
					<li><a href="farmControl.do">축사 제어</a></li>
					<%if(user.getMb_grade() <2){ %>
					<li><a href="#">자동 제어</a></li>
					<li><a href="member.jsp">회원 관리</a></li>
					<li><a href="domesticAnimals.do">돼지 현황</a></li>
					<%} %>
				</ul>
			</nav>
		</div>


		<table>

			<tr>
				<td align="center">
					<section class="4u">
						<a href="#" class="image featured"><img src="images/pic01.png"
							width="" height="" alt="" class="img"></a>
						<div class="box"></div>
					</section>
				</td>

				<td align="center">
					<section class="4u">
						<a href="#" class="image featured"><img src="images/pic02.png"
							width="" height="" alt="" class="img"></a>
						<div class="box"></div>
					</section>
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
			<tr style="margin: 10px">
				<td align="center">
					<section class="4u">
						<a href="#" class="image featured"><img src="images/pic03.png"
							width="" height="" alt="" class="img"></a>
						<div class="box"></div>
					</section>
				</td>

				<td align="center">
					<section class="4u">
						<a href="#" class="image featured"><img src="images/pic04.png"
							width="" height="" alt="" class="img"></a>
						<div class="box"></div>
					</section>
				</td>
			</tr>
		</table>



	</div>

</body>
</html>