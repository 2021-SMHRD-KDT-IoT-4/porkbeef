<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Model.UserDAO"%>
<%@page import="com.Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
        <title>소 돼지 관리</title>
        <meta charset="EUC-KR">
        <meta name="description" content="" />
        <meta name="keywords" content="" />

        <script src="js/jquery.min.js"></script>
        <% //배경화면1 %>
            <script src="js/skel.min.js"></script>
            <% //배경화면2 %>
                <script src="js/init.js"></script>
                <% //배경화면3 %>
                    <%-- <script src="js/jquery.dropotron.min.js">
                        </script>
                        <% //?? %>
                            <script src="js/skel-layers.min.js"></script>
                            <% //?? %> --%>
                            
                            
         <style>
			.table{
				border:1px solid black !important ;
			}
			.tr{
				border:1px solid black !important;
			}
			.td{
				border:1px solid black !important;
			}
			
		</style>   
    </head>
<body>

	

	<%
		MemberDTO user = (MemberDTO)session.getAttribute("user");
		int grade = 3; 
		
		if(user!= null){
			grade = user.getMb_grade();
			System.out.print(user.getMb_id());
			System.out.print(grade);
		}
		if(user == null){
			response.sendRedirect("Login.jsp");
		}else if(grade != 0){
			response.sendRedirect("index.jsp");
		}
	%>
	


	<!-- Wrapper -->
			<div class="wrapper style1">

				<!-- <!-- Header -->
					<!-- <div id="header" class="skel-panels-fixed">
						<div id="logo">
							<h1><a href="Login.jsp">소 관리 돼지</a></h1>
							<span class="tag">by TEMPLATED</span>
						</div>
						<nav id="nav">
							<ul>
								<li><a href="left-sidebar.html">축사제어</a></li>
								<li><a href="#">자동 제어</a></li>
								<li><a href="right-sidebar.html">회원관리</a></li>
								<li><a href="no-sidebar.html">돼지현황</a></li>
							</ul>
						</nav>
					</div> -->
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
					<li><a href="automaticControl.do">자동 제어</a></li>
					<li><a href="member.jsp">회원 관리</a></li>
					<li><a href="domesticAnimals.do">돼지 현황</a></li>
					<%} %>
					<li><a href="logout.do">로그아웃</a></li>
				</ul>
			</nav>
		</div>

				<!-- Banner -->
					<div id="banner" class="container">
						<section>
							<p style = "font-size:35px; font-family:'휴먼둥근헤드라인'; ">☞회원관리☜</p>
						</section>
					</div>

				<!-- Extra -->
				
					<div class="wrapper style2">
						
							<table class = "table">
								<tr class ="tr">
									<td class = "td" align = "center">아이디</td>
									<td class = "td" align = "center">닉네임</td>
									<td class = "td" align = "center">등급</td>
									<td class = "td" align = "center">등급선택</td>
									<td class = "td" align = "center">수정</td>
								</tr>
								
								<%
									UserDAO dao = new UserDAO();
									ArrayList<MemberDTO> list = dao.getAllMember();
								%>
								
								<%for(int i = 0; i < list.size() ; i++){ %>
								<form action="updateMember.do" align = "right">
									<tr class = "tr">
										<td class = "td" align = "center"><%=list.get(i).getMb_id() %></td>
										<td class = "td" align = "center"><%=list.get(i).getNick_name() %></td>
										<td class = "td" align = "center"><%=list.get(i).getMb_grade() %></td>
										<td class = "td" align = "center">
											<select id = "grade" name = "mb_grade">
												<option value = "none">====선택====</option>
												<option value = "0">0</option>
												<option value = "1">1</option>
												<option value = "2">2</option>
												<option value = "3">3</option>
											</select>
										</td >
										<td class = "td" align = "center">
											<input type = "submit" value = "등급 수정">
										
										</td>
										<td>
											<input type="hidden" name = "mb_id" value="<%=list.get(i).getMb_id()%>">
										</td> 
									</tr>
								</form>
								<%} %>
							</table>
							<br><br>
						   
							
					
						</div>
				
	</div>
	<div class="wrapper style1"></div>
		
</body>
</html>