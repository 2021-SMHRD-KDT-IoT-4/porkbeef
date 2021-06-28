<%@page import="com.Model.Domestic_AnimalsDTO"%>
<%@page import="com.Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>돼지현황</title>
<meta charset="EUC-KR">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="viewport" content="width=1024, height=768" />

<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>

<script src="js/jquery.dropotron.min.js"></script>
<script src="js/skel-layers.min.js"></script>

<style type="text/css">
.wrapper.style1 {
	background: url(./images/back.jpg) no-repeat center top;
	padding-top: 11em;
	padding-bottom: 24em;
	background-size: cover;
	background-attachment: fixed;
	-webkit-backface-visibility: hidden;
	-webkit-transform: translateZ(0);
}

#header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	background: #00000000;
	color: #fff;
	padding: 1.25em;
	z-index: 100;
}

.box {
	padding: 20px;
	background: #FFF;
	text-align: center;
	border-radius: 5px;
	margin-left: 19px;
}

table {
	width: 85%;
	margin-left: 13em;
	margin-top: 12em;
}

body, input, select, textarea {
	font-size: 12pt;
	line-height: 2.5em;
}

#logo {
	font-size: 2em;
	cursor: default;
}

#nav {
	position: absolute;
	right: 0;
	top: 0;
	cursor: default;
}

.\34 u {
	width: 200px;
}

.image.featured img {
	display: block;
	width: 90%;
}

.image.featured {
	position: static;
	display: block;
	width: 15em;
	padding: 10px;
	margin: auto;
}

#nav ul li a {
	-moz-transition: color 0.35s ease-in-out;
	-webkit-transition: color 0.35s ease-in-out;
	-o-transition: color 0.35s ease-in-out;
	-ms-transition: color 0.35s ease-in-out;
	transition: color 0.35s ease-in-out;
	display: inline-block;
	color: #ddd;
	color: rgba(255, 255, 255, 0.75);
	text-decoration: none;
}

input[type="submit"], input[type="reset"], input[type="button"], .button
	{
	display: block;
	width: 65%;
	max-width: 350px;
	margin: 0em auto;
	font-size: 15px;
	font-weight: 600;
	border: 2px solid #FFF;
}

.td {
	border-style: solid;
	border-width: 3px;
}
</style>

</head>
<body>
	<%
	// 로그인을 했을때 저장한 session 값 불러오기
	MemberDTO user = (MemberDTO) session.getAttribute("user");
	System.out.println(user);
	
	Domestic_AnimalsDTO[] animalDB= (Domestic_AnimalsDTO[])session.getAttribute("animalDB");
	
	
	if (user == null) {
		response.sendRedirect("Login.jsp");
	}
	%>

	<div class="wrapper style1"
		style="height: 769px; padding-top: 1px; padding-bottom: 0px; width: 1024px;">


		<div id="header" class="skel-panels-fixed"
			style="bottom: 690px; padding-right: 0px; padding-left: 0px; padding-top: 0px; padding-bottom: 0px;">
			<div id="logo"
				style="border-top-width: 0px; padding-top: 14px; padding-bottom: 10px; padding-left: 55px; padding-right: 10px;">
				<h1>
					<a href="index.jsp">소관리돼지</a>
				</h1>
			</div>
			<nav id="nav" style="bottom: 0px; padding-top: 0px;">
				<ul style="margin-bottom: 0px; height: 46px; padding-top: 10px;">
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="farmControl.do">축사 제어</a></li>
					<%if(user!=null && user.getMb_grade() < 2){ %>
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="automaticControl.do">자동 제어</a></li>
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="member.jsp">회원 관리</a></li>
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="domesticAnimals.do">돼지 현황</a></li>
					<%} %>
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="logout.do">로그아웃</a></li>
				</ul>
			</nav>
		</div>

		<!-- 몸체 -->

		<div id="banner" class="container"
			style="margin-left: 50px; margin-right: 50px; margin-bottom: 145px; padding-right: 0px; padding-left: 0px; padding-top: 0px; padding-bottom: 0px; margin-top: 145px;">

			<div
				style="background-color: #ffff99b2; width: 920px; height: 500px; padding-top: 80px; padding-left: 25px; padding-bottom: 80px; padding-right: 25px; border-radius: 5em;">
				<%
				if (user != null && user.getMb_grade() < 2) {
				%>

				<table class="table"
					style="margin-left: 55px; margin-bottom: 0px; margin-top: 0px; padding-left: 0px; margin-right: 55px; color: black; font-weight: 900; padding-top: 0px;">
					<tr>
						<td colspan="7"><p
								style="font-size: 35px; font-family: '휴먼둥근헤드라인'; margin-bottom: 0px; color: #000;">동물관리페이지</p></td>
					</tr>
					<tr class="tr">
						<td class="td" style="width: 71px; height: 46px;">방번호</td>
						<td class="td" style="width: 76px; height: 46px;">개체수</td>
						<td class="td">입고일</td>
						<td class="td">출하일</td>
						<td class="td">1차백신</td>
						<td class="td">2차백신</td>
						<td class="td">3차백신</td>
					</tr>

					<%
					for (int i = 0; i < animalDB.length; i++) {
					%>
					<tr class="tr">
						<td class="td"><%=animalDB[i].getRoom()%></td>
						<td class="td"><%=animalDB[i].getProduct_cnt()%></td>
						<td class="td"><%=animalDB[i].getReceving_date()%></td>
						<td class="td"><%=animalDB[i].getForwarding_date()%></td>
						<td class="td"><%=animalDB[i].getFir_vaccine()%></td>
						<td class="td"><%=animalDB[i].getSec_vaccine()%></td>
						<td class="td"><%=animalDB[i].getThr_vaccine()%></td>
					</tr>
					<%}%>
				<%}%>
				</table>
			</div>
		</div>
	</div>
</body>
</html>