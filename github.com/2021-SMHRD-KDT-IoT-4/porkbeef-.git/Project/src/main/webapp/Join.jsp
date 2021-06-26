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
                padding-top: 4em;
                background-size: cover;
                background-attachment: fixed;
                -webkit-backface-visibility: hidden;
                -webkit-transform: translateZ(0);
            }

            .wrapper.style2 {
                padding: 5em;
                background: #d84780;
                color: white;
                margin: 10em;
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
            }

            table {
                width: 60%;
                margin: auto;
                white-space: pre-line;
            }

            #button {
                text-align-last: center;
            }

            #txt {
                color: white;
                float: right;
                position: relative;
                top: 312px;
                right: 840px;
            }

            form {
                width: 60%;
                margin: auto;
            }
        </style>
    </head>

    <body>
        <div class="wrapper style1">
            <div class="wrapper style2">

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
                        <tr>
                            <td id=button><input type="submit" class="button alt" value="회원가입"></td>
                        </tr>
                    </table>
                </form>

            </div>
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