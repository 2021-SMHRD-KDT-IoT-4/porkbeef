<%@page import="com.Model.Actuator_Status_DTO" %>
    <%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>

        <!DOCTYPE html>
        <html>

        <head>

            <title>이름 정해야함</title>
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
        </head>

        <body>

            <% %>


                <!-- Wrapper -->
                <div class="wrapper style1">

                    <!-- Header -->
                    <div id="header" class="skel-panels-fixed">
                        <div id="logo">
                            <h1><a href="index.html">소관리돼지(CI)</a></h1>
                            <span class="tag">보조제목2</span>
                        </div>
                        <nav id="nav">
                            <ul>
                                <li class="active"><a href="farmControl.do">축사 제어</a></li>
                                <li><a href="member.jsp">회원 관리</a></li>
                                <li><a href="domesticAnimals.do">돼지 현황</a></li>
                            </ul>
                        </nav>
                    </div>

                    <% Actuator_Status_DTO actu_Status=(Actuator_Status_DTO)session.getAttribute("Actuator_Status_All");
                        %>

                        <!-- 몸체 -->
                        <div id="extra">
                            <div class="container">
                                <div class="row no-collapse-1">
                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">
                                            <h1>사료주기</h1>
                                            <br>

                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    상태는 <%=actu_Status.getAct_feed() %> 입니다.
                                                </h1>
                                                <br>
                                                <input type="button" id="Act_feed" value="동작"
                                                    onclick="action_actuator_State(1,<%=actu_Status.getAct_feed() %>)">

                                                <% // action_actuator_State(센서변수번호 - 1~7번 / 센서동작상태 - 0또는 1)%>

                                                    <%}else{ %>
                                                        <h1>
                                                            상태 정보가 없습니다.
                                                        </h1>
                                                        <br>
                                                        <input type="button" id="Act_feed" value="동작"
                                                            onclick="action_Empty()">
                                                        <%}%>
                                        </div>
                                    </form>


                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">
                                            <h1>축사문 개폐</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    상태는 <%=actu_Status.getAct_door() %> 입니다.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_door" value="동작"
                                                    onclick="action_actuator_State(2,<%=actu_Status.getAct_door()%>)">

                                                <%} else{ %>
                                                    <h1>
                                                        상태 정보가 없습니다.
                                                    </h1>
                                                    <br>
                                                    <input type="button" id="act_door" value="동작"
                                                        onclick="action_Empty()">
                                                    <%}%>
                                        </div>
                                    </form>

                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">
                                            <h1>흡배기 동작/정지</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    상태는 <%=actu_Status.getAct_absor() %> 입니다.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_absor" value="동작"
                                                    onclick="action_actuator_State(3,<%=actu_Status.getAct_absor()%>)">
                                                <%} else{ %>
                                                    <h1>
                                                        상태 정보가 없습니다.
                                                    </h1>
                                                    <br>
                                                    <input type="button" id="act_absor" value="동작"
                                                        onclick="action_Empty()">
                                                    <%}%>
                                        </div>
                                    </form>
                                </div>
                                <div class="row no-collapse-1">
                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">

                                            <h1>에어컨 동작/정지</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    상태는 <%=actu_Status.getAct_aircon() %> 입니다.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_aircon" value="동작"
                                                    onclick="action_actuator_State(4,<%=actu_Status.getAct_aircon()%>)">
                                                <%} else{ %>
                                                    <h1>
                                                        상태 정보가 없습니다.
                                                    </h1>
                                                    <br>
                                                    <input type="button" id="act_aircon" value="동작"
                                                        onclick="action_Empty()">
                                                    <%}%>
                                        </div>
                                    </form>

                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">
                                            <h1>펌프 동작/정지</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    상태는 <%=actu_Status.getAct_pump() %> 입니다.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_pump" value="동작"
                                                    onclick="action_actuator_State(5,<%=actu_Status.getAct_pump()%>)">
                                                <%} else{ %>
                                                    <h1>
                                                        상태 정보가 없습니다.
                                                    </h1>
                                                    <br>
                                                    <input type="button" id="act_pump" value="동작"
                                                        onclick="action_Empty()">
                                                    <%}%>
                                        </div>
                                    </form>

                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">
                                            <h1>보일러 동작/정지</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    상태는 <%=actu_Status.getAct_boil() %> 입니다.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_boil" value="동작"
                                                    onclick="action_actuator_State(6,<%=actu_Status.getAct_boil()%>)">
                                                <%} else{ %>
                                                    <h1>
                                                        상태 정보가 없습니다.
                                                    </h1>
                                                    <br>
                                                    <input type="button" id="act_boil" value="동작"
                                                        onclick="action_Empty()">
                                                    <%}%>
                                        </div>
                                    </form>
                                </div>

                                <div class="row no-collapse-1">
                                    <section class="4u">

                                        <% // 사이즈로인해 그냥 뒀음 css 추가하거나 조정해야함%>
                                    </section>
                                    <form class="4u" action="farmControl.do" method="post">
                                        <a href="#" class="image featured"><img src="" alt=""></a>
                                        <div class="box">
                                            <h1>가습기 동작/정지</h1>
                                            <br>
                                            <% if(actu_Status !=null){ %>
                                                <h1>
                                                    상태는 <%=actu_Status.getAct_humid() %> 입니다.
                                                </h1>
                                                <br>
                                                <input type="button" id="act_humid" value="동작"
                                                    onclick="action_actuator_State(7,<%=actu_Status.getAct_humid()%>)">
                                                <%} else{ %>
                                                    <h1>
                                                        상태 정보가 없습니다.
                                                    </h1>
                                                    <br>
                                                    <input type="button" id="act_humid" value="동작"
                                                        onclick="action_Empty()">
                                                    <%}%>
                                        </div>
                                    </form>

                                </div>

                                <div id="copyright">
                                    <% // 사이즈로인해 그냥 뒀음 상단 공간을 늘리거나 이걸 그냥 두거나 %>
                                </div>
                            </div>
                        </div>
                </div>

                <script>

                    function action_Empty() {

                        alert("로그인 해주세요.");
                    }


                    function action_actuator_State(actuator_Num, actuator_State) {

                    	console.log(<%=actu_Status.getAct_feed()%>);
                    	
                        // 1.밥통,2.축사문,3.흡배기,4.에어컨,5.펌프,6.보일러,7.가습기
                        if (actuator_Num == 1) {

                            if (actuator_State == 0) {
                                alert("1변경됐습니다.");
                            <%
                                    actu_Status.setAct_feed(1);
                            %>
                            
                        } else if (actuator_State == 1) {
                                alert("2변경됐습니다.");
                                
                        	<%
                                    actu_Status.setAct_feed(0);
                        	%>
                       	 }

                        }
                        if (actuator_Num == 2) {

                            if (actuator_State == 0) {
                                alert("변경됐습니다.");
                            <%
                                    actu_Status.setAct_door(1);    
                            %>

                        } else if (actuator_State == 1) {
                                alert("변경됐습니다.");
                        	<%
                                    actu_Status.setAct_door(0);    
                        	%>
                     		 }
                        }
                        if (actuator_Num == 3) {

                            if (actuator_State == 0) {
                                alert("변경됐습니다.");
                                actu_sate = 1;
                            <%
                                    actu_Status.setAct_absor(1);    
                            %>

                        } else if (actuator_State == 1) {
                                alert("변경됐습니다.");
                        	<%
                                    actu_Status.setAct_absor(0);    
                        	%>
                       	 }
                        }
                        if (actuator_Num == 4) {

                            if (actuator_State == 0) {
                                alert("변경됐습니다.");
                            <%
                                    actu_Status.setAct_aircon(1);    
                            %>

                        } else if (actuator_State == 1) {
                                alert("변경됐습니다.");
                        	<%
                                    actu_Status.setAct_aircon(0);    
                        	%>
                       		 }
                        }
                        if (actuator_Num == 5) {

                            if (actuator_State == 0) {
                                alert("변경됐습니다.");
                            <%
                                    actu_Status.setAct_pump(1);    
                            %>

                        } else if (actuator_State == 1) {
                                alert("변경됐습니다.");
                        	<%
                                    actu_Status.setAct_pump(0);    
                        	%>
                        }
                        }
                        if (actuator_Num == 6) {

                            if (actuator_State == 0) {
                                alert("변경됐습니다.");
                            <%
                                    actu_Status.setAct_boil(1);  
                            %>

                        } else if (actuator_State == 1) {
                                alert("변경됐습니다.");
                        	<%
                                    actu_Status.setAct_boil(0);  
                        	
                        	%>
                        }
                        }
                        if (actuator_Num == 7) {

                            if (actuator_State == 0) {
                                alert("변경됐습니다.");
                            <%
                                    actu_Status.setAct_humid(1);  
                            %>

                       				 } 		else if (actuator_State == 1) {
                                alert("변경됐습니다.");
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