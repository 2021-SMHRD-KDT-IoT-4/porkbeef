<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>ȸ������</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-wide.css" />
</noscript>
</head>
<body>
	<div class="wrapper style1">
		<div class="wrapper style2" style="height: 100%">
			<form action="Join.do">
				<input type="text" name="mb_id" placeholder="ID"/>
				<div style="height: 30px"></div>
				<input type="text" id = "PW" name="mb_pw" placeholder="PW"/>
				<div style="height: 30px"></div>
				<input type="text" id = "PWCheck" name="PWCheck" placeholder="PWCheck" onchange="pwcheck()"/>
				<span id = "txt">��й�ȣ�� Ȯ��</span>
				<div style="height: 30px"></div>
				<input type="text" name="nick_name" placeholder="NickName"/>
				<div style="height: 30px"></div>
				<input type="submit" class="button alt" value="ȸ������">
			</form>


		</div>
	</div>
	<div class="wrapper style1"></div>
	
	<script>
	
		function pwcheck(){
			
			let PW = document.getElementById("PW").value;
            let PWCheck = document.getElementById("PWCheck").value;
            
            if(PW==PWCheck){
                document.getElementById("txt").innerText = "��й�ȣ�� ��ġ�մϴ�.";
             
            }else{
                document.getElementById("txt").innerText = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
            }
            
		}
		
		
	</script>
	
	
</body>
</html>