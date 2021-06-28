<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>회원가입</title>
        <meta charset="EUC-KR">
        <meta name="description" content="" />
        <meta name="keywords" content="" />

        <script src="js/jquery.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/init.js"></script>

        <script src="js/jquery.dropotron.min.js"></script>
        <script src="js/skel-layers.min.js"></script>

        <style type="text/css">
            .wrapper.style1 {
                padding-top: 15em;
                padding-bottom: 14em;
                background-size: cover;
                background-attachment: fixed;
                -webkit-backface-visibility: hidden;
                -webkit-transform: translateZ(0);
            }


            input[type="submit"].alt,
            input[type="button"].alt,
            .button.alt {
                border: 2px solid #FFF;
            }

            input[type="text"],
            input[type="password"],
            textarea {

                line-height: 2em;
                -moz-appearance: none;
                -webkit-appearance: none;
                -o-appearance: none;
                -ms-appearance: none;
                appearance: none;
                background: white;
                color: #555555;
                display: -webkit-box;
                outline: 0;
                padding: 1em 1em;
                text-decoration: none;
                width: 100%;
                border-radius: 6px;
                opacity: 0.7;
            }

            table {
                width: 60%;
                margin: auto;
                white-space: pre-line;
            }

            #button {
                position: relative;
                left: 18.5em;
            }

            #txt {
                color: white;
                float: right;
                position: relative;
                top: 19.5em;
                right: 68em;
            }

            form {
                width: 45%;
                margin: auto;
            }
        </style>
    </head>

    <body>
        <div class="wrapper style1">

            <span id="txt"></span>

            <form action="Join.do">
                <table>
                    <tr>
                        <td><input type="text" name="mb_id" placeholder="아이디" /><br></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" id="PW" name="mb_pw" placeholder="비밀번호" /><br>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="password" id="PWCheck" name="PWCheck" placeholder="비밀번호 재확인"
                                onchange="pwcheck()" /><br>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" name="nick_name" placeholder="닉네임" /><br></td>
                    </tr>
                </table>


                <span id=button><input type="submit" class="button alt" value="회원가입" />

                    <input type="button" class="button alt" value="뒤로가기" onclick="location.href='Login.jsp';" />
                </span>
            </form>
        </div>

        <script>

            function pwcheck() {

                let PW = document.getElementById("PW").value;
                let PWCheck = document.getElementById("PWCheck").value;

                if (PW == PWCheck) {
                    document.getElementById("txt").innerText = "비밀번호 일치";

                } else {
                    document.getElementById("txt").innerText = "비밀번호 불일치";
                }
            }

        </script>

    </body>

    </html>