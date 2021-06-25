<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Model.UserDAO"%>
<%@page import="com.Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
        <title>�� ���� ����</title>
        <meta charset="EUC-KR">
        <meta name="description" content="" />
        <meta name="keywords" content="" />

        <script src="js/jquery.min.js"></script>
        <% //���ȭ��1 %>
            <script src="js/skel.min.js"></script>
            <% //���ȭ��2 %>
                <script src="js/init.js"></script>
                <% //���ȭ��3 %>
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
							<h1><a href="Login.jsp">�� ���� ����</a></h1>
							<span class="tag">by TEMPLATED</span>
						</div>
						<nav id="nav">
							<ul>
								<li><a href="left-sidebar.html">�������</a></li>
								<li><a href="#">�ڵ� ����</a></li>
								<li><a href="right-sidebar.html">ȸ������</a></li>
								<li><a href="no-sidebar.html">������Ȳ</a></li>
							</ul>
						</nav>
					</div> -->
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

				<!-- Banner -->
					<div id="banner" class="container">
						<section>
							<p style = "font-size:35px; font-family:'�޸յձ�������'; ">��ȸ��������</p>
						</section>
					</div>

				<!-- Extra -->
				
					<div class="wrapper style2">
						
							<table class = "table">
								<tr class ="tr">
									<td class = "td" align = "center">���̵�</td>
									<td class = "td" align = "center">�г���</td>
									<td class = "td" align = "center">���</td>
									<td class = "td" align = "center">��޼���</td>
									<td class = "td" align = "center">����</td>
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
												<option value = "none">====����====</option>
												<option value = "0">0</option>
												<option value = "1">1</option>
												<option value = "2">2</option>
												<option value = "3">3</option>
											</select>
										</td >
										<td class = "td" align = "center">
											<input type = "submit" value = "��� ����">
										
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