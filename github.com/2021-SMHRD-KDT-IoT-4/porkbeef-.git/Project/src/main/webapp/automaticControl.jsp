<%@page import="com.Model.Automatic_Control_DTO"%>
<%@page import="com.Model.Automatic_Control_DAO"%>
<%@page import="com.Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

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

                    <!-- Header -->
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

                   		<% Automatic_Control_DTO acdto = (Automatic_Control_DTO)session.getAttribute("Automatic");
                        %> 
                        
                        <% Automatic_Control_DAO dao = new Automatic_Control_DAO(); %>
                       

                        <!-- ��ü -->
                        <div id="extra">
                            <div class="container">
                                <div class="row no-collapse-1">
                                
                                    <form class="4u" action = "updateAutomaticControl.do">
                                        <div class="box">
                                            <h1>��� ��� ���� �ð�</h1>
                                            <br>
                                            <% if(acdto !=null){ %>
                                                <h1>
                                                    <%=acdto.getFeed_time() %>
                                                    <input type = "text">
                                                    <input type = "submit" name = "feed_time" value = "����">
                                                </h1>
                                                <br>
                                              <%}else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <%}%>
                                               
                                        </div>

                                    </form>
									</div>

									<div class="row no-collapse-1">
                                    <form class="4u" action = "updateAutomaticControl.do">
                                        <div class="box">
                                            <h1>���� ���� ���� ��</h1>
                                            <br>
                                            <% if(acdto !=null){ %>
                                                <h1>
                                                    <%=acdto.getAbsor_start() %>%
                                                     <input type = "text">
                                                    <input type = "submit" name = "absor_start" value = "����">
                                                </h1>
                                                <br>
                                                <%} else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <%}%>
                                        </div>
                                    </form>

                                    <form class="4u" action = "updateAutomaticControl.do">
                                        <div class="box">
                                            <h1>���� ���� ���� ��</h1>
                                            <br>
                                            <% if(acdto !=null){ %>
                                                <h1>
                                                    <%=acdto.getAbsor_stop() %>%
                                                     <input type = "text">
                                                    <input type = "submit" name = "absor_stop" value = "����">
                                                </h1>
                                                <br>
                                                <%} else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <%}%>
                                        </div>
                                    </form>
                                    </div>
                                
                                <div class="row no-collapse-1" action = "updateAutomaticControl.do">
                                    <form class="4u" >
                                        <div class="box">

                                            <h1>������ ���� ���� �µ�</h1>
                                            <br>
                                            <% if(acdto !=null){ %>
                                                <h1>
                                                    <%=acdto.getAircon_start() %>��
                                                     <input type = "text">
                                                    <input type = "submit" name = "aircon_start" value = "����">
                                                </h1>
                                                <br>
                                               <%} else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <%}%>
                                        </div>
                                    </form>

                                    <form class="4u" action = "updateAutomaticControl.do">
                                        <div class="box">
                                            <h1>������ ���� ���� �µ�</h1>
                                            <br>
                                            <% if(acdto !=null){ %>
                                                <h1>
                                                    <%=acdto.getAircon_stop() %>��
                                                     <input type = "text">
                                                    <input type = "submit" name = "aircon_stop" value = "����">
                                                </h1>
                                                <br>
                                                <%} else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <%}%>
                                        </div>
                                    </form>
                                    </div>

									 <div class="row no-collapse-1">
                                    <form class="4u" action = "updateAutomaticControl.do">
                                        <div class="box">
                                            <h1>������ ���� ���� ��</h1>
                                            <br>
                                            <% if(acdto !=null){ %>
                                                <h1>
                                                    <%=acdto.getHumid_start() %>%
                                                     <input type = "text">
                                                    <input type = "submit" name = "humid_start" value = "����">
                                                </h1>
                                                <br>
                                                <%} else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <%}%>
                                        </div>
                                    </form>
                                
                                    <form class="4u" action = "updateAutomaticControl.do">
                                        <div class="box">
                                            <h1>������ ���� ���� ��</h1>
                                            <br>
                                            <% if(acdto !=null){ %>
                                                <h1>
                                                    <%=acdto.getHumid_stop() %>%
                                                     <input type = "text">
                                                    <input type = "submit" name = "humid_stop" value = "����">
                                                </h1>
                                                <br>
                                                <%} else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <%}%>
                                        </div>
                                    </form>
                                    </div>
                                    
                                     <div class="row no-collapse-1">
                                    <form class="4u" action = "updateAutomaticControl.do">
                                        <div class="box">
                                            <h1>���Ϸ� ���� ���� �µ�</h1>
                                            <br>

                                            <% if(acdto !=null){ %>
                                                <h1>
                                                    <%=acdto.getBoil_start() %>��
                                                     <input type = "text">
                                                    <input type = "submit" name = "boil_start" value = "����">
                                                </h1>
                                                <br>
                                              <%}else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <%}%>
                                               
                                        </div>

                                    </form>
                                    
                                    <form class="4u" action = "updateAutomaticControl.do">
                                        <div class="box">
                                            <h1>���Ϸ� ���� ���� �µ�</h1>
                                            <br>

                                            <% if(acdto !=null){ %>
                                                <h1>
                                                    <%=acdto.getBoil_stop() %>��
                                                     <input type = "text">
                                                    <input type = "submit" name = "boil_stop" value = "����">
                                                </h1>
                                                <br>
                                              <%}else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <%}%>
                                               
                                        </div>

                                    </form>

                                </div>

                                <div id="copyright">
                                    <% // ����������� �׳� ���� ��� ������ �ø��ų� �̰� �׳� �ΰų� %>
                                </div>
                            </div>
                        </div>
                </div>

                <script>
                    function action_State(num, state) {

                    	if (num == 0) {

                    		alert("num = 0")

                        }else if(num == 1){
                        	
                        	alert("num = 1")
                        }

                    	if (state == 0) {
                    		alert("state = 0")

                        }else if(state == 1){
                        	alert("state = 1")
                        }
                       
                     }

                </script>
</body>
</html>