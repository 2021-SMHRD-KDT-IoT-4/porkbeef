<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.Model.Domestic_AnimalsDTO"%>
<%@page import="com.Model.Entire_Environment_DTO"%>
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
		Entire_Environment_DTO entire_environment_DTO = null;
		Domestic_AnimalsDTO[] animalsDTOs = null;
		if(user == null){
			response.sendRedirect("Login.jsp");
		}else{
			
				entire_environment_DTO =  
						(Entire_Environment_DTO)session.getAttribute("StateAllSelect");	
				animalsDTOs = 
						(Domestic_AnimalsDTO[])session.getAttribute("animalDB");
		
				String vacTmpDate=animalsDTOs[0].getForwarding_date(),forwardTmpDate="";
				System.out.print(vacTmpDate);
				SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		        Date date1 = sdformat.parse("2020-01-25");
				for(int i = 0; i <2 ; i++){
					for(int j = 0; j <3 ; j++){
						
					}	
					if(forwardTmpDate.equals("")){//
						
					}
				}
				
		}
		
	%>
	<% if(user!=null ){%>
	<!-- Wrapper -->
	<div class="wrapper style1">
	
		<!-- Header -->

		<div id="header" class="skel-panels-fixed">
			<div id="logo">
				<h1>
					<a href="index.jsp">소관리돼지</a>
				</h1>
			</div>
			<nav id="nav">
				<ul>
					<li><a href="farmControl.do">축사 제어</a></li>
					<%if(user!=null && user.getMb_grade() <2){ %>
					<li><a href="#.do">자동 제어</a></li>
					<li><a href="member.jsp">회원 관리</a></li>
					<li><a href="domesticAnimals.do">돼지 현황</a></li>
					<%} %>
					<li><a href="logout.do">로그아웃</a></li>
				</ul>
			</nav>
		</div>


		<table>

			<tr>
				<td align="center">
					<section class="4u">
						<a href="#" class="image featured"><img src="images/pic01.png"
							width="" height="" alt="" class="img"></a>
						<div class="box">
							<span>온도:<%=entire_environment_DTO.getTemp() %>º</span>
							<span>습도:<%=entire_environment_DTO.getHumi() %>%</span>
						</div>
					</section>
				</td>

				<td align="center">
					<section class="4u">
						<a href="#" class="image featured"><img src="images/pic02.png"
							width="" height="" alt="" class="img" id = "weatherImg"></a>
						<div class="box">
							<span id= "weather"></span>
						</div>
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
	<%} %>
</body>
</html>