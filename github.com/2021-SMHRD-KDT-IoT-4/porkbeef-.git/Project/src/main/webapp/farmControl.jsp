<%@page import="com.Model.MemberDTO" %>
    <%@page import="com.Model.Actuator_Status_DTO" %>
        <%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>

            <!DOCTYPE html>
            <html>

            <head>

                <title>�������</title>
                <meta charset="EUC-KR">
                <meta name="description" content="" />
                <meta name="keywords" content="" />

                <script src="js/jquery.min.js"></script>
                <script src="js/skel.min.js"></script>
                <script src="js/init.js"></script>

                <script src="js/jquery.dropotron.min.js"></script>
                <script src="js/skel-layers.min.js"></script>

            </head>

            <body>
                <%
				// �α����� ������ ������ session �� �ҷ�����
					MemberDTO user = (MemberDTO) session.getAttribute("user");%>

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
                                    <%if(user!=null && user.getMb_grade() < 2){ %>
                                        <li><a href="automaticControl.do">�ڵ� ����</a></li>
                                        <li><a href="member.jsp">ȸ�� ����</a></li>
                                        <li><a href="domesticAnimals.do">���� ��Ȳ</a></li>
                                        <%} %>
                                            <li><a href="logout.do">�α׾ƿ�</a></li>
                                </ul>
                            </nav>
                        </div>

                        <% Actuator_Status_DTO actu_Status = (Actuator_Status_DTO)session.getAttribute("Actuator_Status_All"); %>

                            <!-- ��ü -->
                            <div id="extra">
                                <div class="container">
                                    <div class="row no-collapse-1">
                                        <form class="4u" action="farmControlSet.do" method="post">
                                            <a href="#" class="image featured"><img src="" alt=""></a>
                                            <div class="box">
                                                <h1>����ֱ�</h1>
                                                <br>

                                                <% if (actu_Status !=null) { %>
                                                    <h1 id="feedval">
                                                        ���´�
                                                        <%=actu_Status.getAct_feed()%>
                                                            �Դϴ�.
                                                    </h1>
                                                    <br> <input type="button" id="Act_feed" value="����"
                                                        onclick="action_actuator_State(1,<%=actu_Status.getAct_feed()%>)">

                                                    <% // action_actuator_State(����������ȣ - 1~7�� / �������ۻ��� - 0�Ǵ� 1) %>

                                                        <% } else { %>
                                                            <h1>���� ������ �����ϴ�.</h1>
                                                            <br> <input type="button" id="Act_feed" value="����"
                                                                onclick="action_Empty()">
                                                            <% } %>
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

                        function action_Empty() {

                            alert("�α��� ���ּ���.");
                        }

                        </script>
                        
                        <script type="text/javascript">
                        
                        
                        function action_actuator_State(actuator_Num, actuator_State) {

                        

                            // 1.����,2.��繮,3.����,4.������,5.����,6.���Ϸ�,7.������
                            if (actuator_Num == 1) {
                            	
                                if (actuator_State == 0) {
                                    alert("1����ƽ��ϴ�.");
								<% actu_Status.setAct_feed(1);%>  
								
								console.log(<%=actu_Status.getAct_feed() %>);
								
								
								 <% session.setAttribute("Actuator_Status_All", actu_Status);%>
								 
								 location.href="farmControlSet.do";
								
							} else if (actuator_State == 1) {
                                    alert("2����ƽ��ϴ�.");
								<% actu_Status.setAct_feed(0);%>
								
								console.log(<%=actu_Status.getAct_feed() %>);
								
								 <% session.setAttribute("Actuator_Status_All", actu_Status);%>
								 
								 location.href="farmControlSet.do";
									}
                          	 	 }
                            
                            }
                        
                       

                        

                    </script>

            </body>

            </html>