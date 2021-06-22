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
                        <li class="active"><a href="#">축사 제어</a></li>
                        <li><a href="#">회원 관리</a></li>
                        <li><a href="#">돼지 현황</a></li>
                    </ul>
                </nav>
            </div>

            <!-- 몸체 -->
            <div id="extra">
                <div class="container">
                    <div class="row no-collapse-1">
                        <form class="4u" action="#">
                            <a href="#" class="image featured"><img src="images/pic01.png" alt=""></a>
                            <div class="box">
                                <h1>사료주기</h1>
                                <br>
                                <input type="submit" value="이동하기">
                            </div>

                        </form>

                        <form class="4u" action="#">
                            <a href="#" class="image featured"><img src="images/pic02.png" alt=""></a>
                            <div class="box">
                                <h1>축사문 개폐</h1>
                                 <br>
                                <input type="submit" value="이동하기">
                            </div>
                        </form>

                        <form class="4u" action="#">
                            <a href="#" class="image featured"><img src="images/pic03.png" alt=""></a>
                            <div class="box">
                                <h1>흡배기 동작/정지</h1>
                                <br>
                                <input type="submit" value="이동하기">
                            </div>
                        </form>
                    </div>
                    <div class="row no-collapse-1">
                        <form class="4u" action="#">
                            <a href="#" class="image featured"><img src="images/pic01.png" alt=""></a>
                            <div class="box">
                                <h1>에어컨 동작/정지</h1>
                                <br>
                                <input type="submit" value="이동하기">
                            </div>
                        </form>

                        <form class="4u" action="#">
                            <a href="#" class="image featured"><img src="images/pic02.png" alt=""></a>
                            <div class="box">
                                <h1>펌프 동작/정지</h1>
                                <br>
                                <input type="submit" value="이동하기">
                            </div>
                        </form>

                        <form class="4u" action="#">
                            <a href="#" class="image featured"><img src="images/pic03.png" alt=""></a>
                            <div class="box">
                                <h1>보일러 동작/정지</h1>
                                <br>
                                <input type="submit" value="이동하기">
                            </div>
                        </form>
                    </div>

                    <div class="row no-collapse-1">
                        <section class="4u">

                            <% // 사이즈로인해 그냥 뒀음 css 추가하거나 조정해야함%>
                        </section>

                        <form class="4u" action="#">
                            <a href="#" class="image featured"><img src="images/pic02.png" alt=""></a>
                            <div class="box">
                                <h1>가습기 동작/정지</h1>
                                <br>
                                <input type="submit" value="이동하기">
                            </div>
                        </form>

                    </div>

                    <div id="copyright">
                        <% // 사이즈로인해 그냥 뒀음 상단 공간을 늘리거나 이걸 그냥 두거나 %>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>