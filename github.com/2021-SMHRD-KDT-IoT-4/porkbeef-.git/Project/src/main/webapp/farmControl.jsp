<%@page import="com.Model.Actuator_Status_DTO" %>
    <%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>

        <!DOCTYPE html>
        <html>

        <head>

            <title>�̸� ���ؾ���</title>
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
        </head>

        <body>

            <% %>


                <!-- Wrapper -->
                <div class="wrapper style1">

                    <!-- Header -->
                    <div id="header" class="skel-panels-fixed">
                        <div id="logo">
                            <h1><a href="index.html">�Ұ�������(CI)</a></h1>
                            <span class="tag">��������2</span>
                        </div>
                        <nav id="nav">
                            <ul>
                                <li class="active"><a href="farmControl.do">��� ����</a></li>
                                <li><a href="member.jsp">ȸ�� ����</a></li>
                                <li><a href="domesticAnimals.do">���� ��Ȳ</a></li>
                            </ul>
                        </nav>
                    </div>

                    <% Actuator_Status_DTO actu_Status=(Actuator_Status_DTO)session.getAttribute("Actuator_Status_All");
                        %>

                        <!-- ��ü -->
                        <div id="extra">
                            <div class="container">
                                <div class="row no-collapse-1">
                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">
                                            <h1>����ֱ�</h1>
                                            <br>

                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_feed() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="Act_feed" value="����"
                                                    onclick="action_actuator_State(1,<%=actu_Status.getAct_feed() %>)">

                                                <% // action_actuator_State(����������ȣ - 1~7�� / �������ۻ��� - 0�Ǵ� 1)%>

                                                    <%}else{ %>
                                                        <h1>
                                                            ���� ������ �����ϴ�.
                                                        </h1>
                                                        <br>
                                                        <input type="button" id="Act_feed" value="����"
                                                            onclick="action_Empty()">
                                                        <%}%>
                                        </div>
                                    </form>


                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">
                                            <h1>��繮 ����</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_door() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_door" value="����"
                                                    onclick="action_actuator_State(2,<%=actu_Status.getAct_door()%>)">

                                                <%} else{ %>
                                                    <h1>
                                                        ���� ������ �����ϴ�.
                                                    </h1>
                                                    <br>
                                                    <input type="button" id="act_door" value="����"
                                                        onclick="action_Empty()">
                                                    <%}%>
                                        </div>
                                    </form>

                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">
                                            <h1>���� ����/����</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_absor() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_absor" value="����"
                                                    onclick="action_actuator_State(3,<%=actu_Status.getAct_absor()%>)">
                                                <%} else{ %>
                                                    <h1>
                                                        ���� ������ �����ϴ�.
                                                    </h1>
                                                    <br>
                                                    <input type="button" id="act_absor" value="����"
                                                        onclick="action_Empty()">
                                                    <%}%>
                                        </div>
                                    </form>
                                </div>
                                <div class="row no-collapse-1">
                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">

                                            <h1>������ ����/����</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_aircon() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_aircon" value="����"
                                                    onclick="action_actuator_State(4,<%=actu_Status.getAct_aircon()%>)">
                                                <%} else{ %>
                                                    <h1>
                                                        ���� ������ �����ϴ�.
                                                    </h1>
                                                    <br>
                                                    <input type="button" id="act_aircon" value="����"
                                                        onclick="action_Empty()">
                                                    <%}%>
                                        </div>
                                    </form>

                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">
                                            <h1>���� ����/����</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_pump() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_pump" value="����"
                                                    onclick="action_actuator_State(5,<%=actu_Status.getAct_pump()%>)">
                                                <%} else{ %>
                                                    <h1>
                                                        ���� ������ �����ϴ�.
                                                    </h1>
                                                    <br>
                                                    <input type="button" id="act_pump" value="����"
                                                        onclick="action_Empty()">
                                                    <%}%>
                                        </div>
                                    </form>

                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">
                                            <h1>���Ϸ� ����/����</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_boil() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_boil" value="����"
                                                    onclick="action_actuator_State(6,<%=actu_Status.getAct_boil()%>)">
                                                <%} else{ %>
                                                    <h1>
                                                        ���� ������ �����ϴ�.
                                                    </h1>
                                                    <br>
                                                    <input type="button" id="act_boil" value="����"
                                                        onclick="action_Empty()">
                                                    <%}%>
                                        </div>
                                    </form>
                                </div>

                                <div class="row no-collapse-1">
                                    <section class="4u">

                                        <% // ����������� �׳� ���� css �߰��ϰų� �����ؾ���%>
                                    </section>
                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">
                                            <h1>������ ����/����</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_humid() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_humid" value="����"
                                                    onclick="action_actuator_State(7,<%=actu_Status.getAct_humid()%>)">
                                                <%} else{ %>
                                                    <h1>
                                                        ���� ������ �����ϴ�.
                                                    </h1>
                                                    <br>
                                                    <input type="button" id="act_humid" value="����"
                                                        onclick="action_Empty()">
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

                    function action_Empty() {

                        alert("�α��� ���ּ���.");
                    }


                    function action_actuator_State(actuator_Num, actuator_State) {

                    	console.log(<%=actu_Status.getAct_feed()%>);
                    	
                        // 1.����,2.��繮,3.����,4.������,5.����,6.���Ϸ�,7.������
                        if (actuator_Num == 1) {

                            if (actuator_State == 0) {
                                alert("1����ƽ��ϴ�.");
                            <%
                                    actu_Status.setAct_feed(1);
                            %>
                            
                        } else if (actuator_State == 1) {
                                alert("2����ƽ��ϴ�.");
                                
                        	<%
                                    actu_Status.setAct_feed(0);
                        	%>
                       	 }

                        }
                        if (actuator_Num == 2) {

                            if (actuator_State == 0) {
                                alert("����ƽ��ϴ�.");
                            <%
                                    actu_Status.setAct_door(1);    
                            %>

                        } else if (actuator_State == 1) {
                                alert("����ƽ��ϴ�.");
                        	<%
                                    actu_Status.setAct_door(0);    
                        	%>
                     		 }
                        }
                        if (actuator_Num == 3) {

                            if (actuator_State == 0) {
                                alert("����ƽ��ϴ�.");
                                actu_sate = 1;
                            <%
                                    actu_Status.setAct_absor(1);    
                            %>

                        } else if (actuator_State == 1) {
                                alert("����ƽ��ϴ�.");
                        	<%
                                    actu_Status.setAct_absor(0);    
                        	%>
                       	 }
                        }
                        if (actuator_Num == 4) {

                            if (actuator_State == 0) {
                                alert("����ƽ��ϴ�.");
                            <%
                                    actu_Status.setAct_aircon(1);    
                            %>

                        } else if (actuator_State == 1) {
                                alert("����ƽ��ϴ�.");
                        	<%
                                    actu_Status.setAct_aircon(0);    
                        	%>
                       		 }
                        }
                        if (actuator_Num == 5) {

                            if (actuator_State == 0) {
                                alert("����ƽ��ϴ�.");
                            <%
                                    actu_Status.setAct_pump(1);    
                            %>

                        } else if (actuator_State == 1) {
                                alert("����ƽ��ϴ�.");
                        	<%
                                    actu_Status.setAct_pump(0);    
                        	%>
                        }
                        }
                        if (actuator_Num == 6) {

                            if (actuator_State == 0) {
                                alert("����ƽ��ϴ�.");
                            <%
                                    actu_Status.setAct_boil(1);  
                            %>

                        } else if (actuator_State == 1) {
                                alert("����ƽ��ϴ�.");
                        	<%
                                    actu_Status.setAct_boil(0);  
                        	
                        	%>
                        }
                        }
                        if (actuator_Num == 7) {

                            if (actuator_State == 0) {
                                alert("����ƽ��ϴ�.");
                            <%
                                    actu_Status.setAct_humid(1);  
                            %>

                       				 } 		else if (actuator_State == 1) {
                                alert("����ƽ��ϴ�.");
                        			<%

                           	         actu_Status.setAct_humid(0);  
                        			%>
                        			}
                        }
                        
                        
                        
                        <% session.setAttribute("Actuator_Status_All", actu_Status);%>
                    }

                </script>

        </body>

        </html>