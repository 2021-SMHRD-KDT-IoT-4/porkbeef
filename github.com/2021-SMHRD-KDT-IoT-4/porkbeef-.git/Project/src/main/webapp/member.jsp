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
	<!-- Wrapper -->
			<div class="wrapper style1">

				<!-- Header -->
					<div id="header" class="skel-panels-fixed">
						<div id="logo">
							<h1><a href="index.html">�� ���� ����</a></h1>
							<span class="tag">by TEMPLATED</span>
						</div>
						<nav id="nav">
							<ul>
								<li><a href="left-sidebar.html">�������</a></li>
								<li><a href="right-sidebar.html">ȸ������</a></li>
								<li><a href="no-sidebar.html">������Ȳ</a></li>
							</ul>
						</nav>
					</div>

				<!-- Banner -->
					<div id="banner" class="container">
						<section>
							<p style = "font-size:35px; font-family:'�޸յձ�������'; border:1px dashed white">��ȸ��������</p>
						</section>
					</div>

				<!-- Extra -->
					<div class="wrapper style2">
						<form action="#" align = "right">
							<table class = "table">
								<tr class ="tr">
									<td class = "td" align = "center">���̵�</td>
									<td class = "td" align = "center">�г���</td>
									<td class = "td" align = "center">���</td>
								</tr>
								
								<tr class = "tr">
									<td class = "td" align = "center"></td>
									<td class = "td" align = "center"></td>
									<td class = "td" align = "center">
										<select id = "grade" name = "grade">
											<option value = "0">0</option>
											<option value = "1">1</option>
											<option value = "2">2</option>
											<option value = "3">3</option>
										</select>
									</td>
								</tr>
							</table>
							<br><br>
						   <input type="submit" value = "����">
							
						</form>
						</div>
				
	</div>
	<div class="wrapper style1"></div>
		
</body>
</html>