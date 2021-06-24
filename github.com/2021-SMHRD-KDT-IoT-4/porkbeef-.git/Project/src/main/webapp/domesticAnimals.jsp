<%@page import="com.Model.Domestic_AnimalsDTO"%>
<%@page import="com.Model.MemberDTO"%>
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
<style>
.table {
	border: 5px solid black !important;
}

.tr {
	border: 1px solid black !important;
}

.td {
	border: 1px solid black !important;
}
</style>




</head>
<body>
	<%
	// 로그인을 했을때 저장한 session 값 불러오기
	MemberDTO info = (MemberDTO) session.getAttribute("user");
	System.out.println(info);
	
	Domestic_AnimalsDTO[] animalDB= (Domestic_AnimalsDTO[])session.getAttribute("animalDB");
	
	
	if (info == null) {
		response.sendRedirect("Login.jsp");
	}
	%>


	<div class="wrapper style1">
		<!-- Page -->
		<div id="page" class="container">

			<% if ( info != null && info.getMb_grade() < 2) {%>
			<h2 align="center">동물관리페이지</h2>
			<table align="center" class="table">
				<br>
				<br>
				<tr border="3px" class="tr">
					<td align="center" class="td">방번호</td>
					<td align="center" class="td">개체수</td>
					<td align="center" class="td">입고일</td>
					<td align="center" class="td">출하일</td>
					<td align="center" class="td">1차백신</td>
					<td align="center" class="td">2차백신</td>
					<td align="center" class="td">3차백신</td>
				</tr>
				
		<%for(int i = 0; i< animalDB.length;i++){ %>
				<tr class="tr">	
					<td align="center" class="td"><%=animalDB[i].getRoom() %></td>
					<td align="center" class="td"><%=animalDB[i].getProduct_cnt() %></td>
					<td align="center" class="td"><%=animalDB[i].getReceving_date() %></td>
					<td align="center" class="td"><%=animalDB[i].getForwarding_date() %></td>
					<td align="center" class="td"><%= animalDB[i].getFir_vaccine() %></td>
					<td align="center" class="td"><%=animalDB[i].getSec_vaccine() %></td>
					<td align="center" class="td"><%=animalDB[i].getThr_vaccine() %></td>
				</tr>
					<%}%>
						<%}%>
			</table>
		
			
			
		</div>
		<div class="wrapper style1"></div>
		<div class="wrapper style1"></div>
		<div class="wrapper style1"></div>
</body>
</html>