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
                                <li class="active"><a href="#">��� ����</a></li>
                                <li><a href="#">ȸ�� ����</a></li>
                                <li><a href="#">���� ��Ȳ</a></li>
                            </ul>
                        </nav>
                    </div>

                    <% Actuator_Status_DTO actu_Status=(Actuator_Status_DTO)session.getAttribute("Actuator_Status_All");
                        %>

                        <!-- ��ü -->
                        <div id="extra">
                            <div class="container">
                                <div class="row no-collapse-1">
                                    <form class="4u" action="GetActuatorStatusCon" method="post">
                                        <a href="#" class="image featured"><img src="images/pic01.png" alt=""></a>
                                        <div class="box">
                                            <h1>����ֱ�</h1>
                                            <br>

                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_feed() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="Act_feed" value="����"
                                                    onclick="action_State(0,<%=actu_Status.getAct_feed() %>)">
                                               
                                               <% //���߿� 0,=actu_Status.getAct_feed()�Ѿ���� Ȯ���ϱ� %>
                                              <%}else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="Act_feed" value="����"
                                                    onclick="action_State(0,1)">
                                                <%}%>
                                               
                                        </div>

                                    </form>


                                    <form class="4u" action="#" method="post">
                                        <a href="#" class="image featured"><img src="images/pic02.png" alt=""></a>
                                        <div class="box">
                                            <h1>��繮 ����</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_door() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="submit" value="����">
                                                <%} else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_door" value="����"
                                                    onclick="action_State(0,1)">
                                                <%}%>
                                        </div>
                                    </form>

                                    <form class="4u" action="#" method="post">
                                        <a href="#" class="image featured"><img src="images/pic03.png" alt=""></a>
                                        <div class="box">
                                            <h1>���� ����/����</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_absor() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="submit" value="����">
                                                <%} else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_absor" value="����"
                                                    onclick="action_State(0,1)">
                                                <%}%>
                                        </div>
                                    </form>
                                </div>
                                <div class="row no-collapse-1">
                                    <form class="4u" action="#" method="post">
                                        <a href="#" class="image featured"><img src="images/pic01.png" alt=""></a>
                                        <div class="box">

                                            <h1>������ ����/����</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_aircon() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="submit" value="����">
                                               <%} else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_aircon" value="����"
                                                    onclick="action_State(0,1)">
                                                <%}%>
                                        </div>
                                    </form>

                                    <form class="4u" action="#" method="post">
                                        <a href="#" class="image featured"><img src="images/pic02.png" alt=""></a>
                                        <div class="box">
                                            <h1>���� ����/����</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_pump() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="submit" value="����">
                                                <%} else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_pump" value="����"
                                                    onclick="action_State(0,1)">
                                                <%}%>
                                        </div>
                                    </form>

                                    <form class="4u" action="#" method="post">
                                        <a href="#" class="image featured"><img src="images/pic03.png" alt=""></a>
                                        <div class="box">
                                            <h1>���Ϸ� ����/����</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_boil() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="submit" value="����">
                                                <%} else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_boil" value="����"
                                                    onclick="action_State(0,1)">
                                                <%}%>
                                        </div>
                                    </form>
                                </div>

                                <div class="row no-collapse-1">
                                    <section class="4u">

                                        <% // ����������� �׳� ���� css �߰��ϰų� �����ؾ���%>
                                    </section>
                                    <form class="4u" action="#" method="post">
                                        <a href="#" class="image featured"><img src="images/pic02.png" alt=""></a>
                                        <div class="box">
                                            <h1>������ ����/����</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    ���´� <%=actu_Status.getAct_humid() %> �Դϴ�.
                                                </h1>
                                                <br>
                                                <input type="submit" value="����">
                                                <%} else{ %>
                                                <h1>
                                                    ���� ������ �����ϴ�.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_humid" value="����"
                                                    onclick="action_State(0,1)">
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