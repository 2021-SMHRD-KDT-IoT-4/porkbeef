<%@page import="com.Model.Domestic_AnimalsDTO"%>
<%@page import="com.Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>������Ȳ</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
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
	// �α����� ������ ������ session �� �ҷ�����
	MemberDTO user = (MemberDTO) session.getAttribute("user");
	System.out.println(user);
	
	Domestic_AnimalsDTO[] animalDB= (Domestic_AnimalsDTO[])session.getAttribute("animalDB");
	
	
	if (user == null) {
		response.sendRedirect("Login.jsp");
	}
	%>








	<div class="wrapper style1">
		<!-- Page -->
		<div id="page" class="container">
<div id="header" class="skel-panels-fixed">
			<div id="logo">
				<h1>
					<a href="index.jsp">�Ұ�������</a>
				</h1>
			</div>
			<nav id="nav">
				<ul>
					<li><a href="farmControl.do">��� ����</a></li>
					<%if(user!=null && user.getMb_grade() <2){ %>
					<li><a href="automaticControl.do">�ڵ� ����</a></li>
					<li><a href="member.jsp">ȸ�� ����</a></li>
					<li><a href="domesticAnimals.do">���� ��Ȳ</a></li>
					<%} %>
					<li><a href="logout.do">�α׾ƿ�</a></li>
				</ul>
			</nav>
		</div>




			<% if ( user != null && user.getMb_grade() < 2) {%>
			<h2 align="center">��������������</h2>
			<table align="center" class="table">
				<br>
				<br>
				<tr border="3px" class="tr">
					<td align="center" class="td">���ȣ</td>
					<td align="center" class="td">��ü��</td>
					<td align="center" class="td">�԰���</td>
					<td align="center" class="td">������</td>
					<td align="center" class="td">1�����</td>
					<td align="center" class="td">2�����</td>
					<td align="center" class="td">3�����</td>
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
			
		</div>
		<div class="wrapper style1"></div>
		<div class="wrapper style1"></div>
		<div class="wrapper style1"></div>
</body>
</html>