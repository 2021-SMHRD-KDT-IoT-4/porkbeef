<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.Model.Domestic_AnimalsDTO"%>
<%@page import="com.Model.Entire_Environment_DTO"%>
<%@page import="com.Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE HTML>
<html>
<head>
<title>����</title>
<meta charset="EUC-KR">
                <meta name="description" content="" />
                <meta name="keywords" content="" />

                <script src="js/jquery.min.js"></script>
                <script src="js/skel.min.js"></script>
                <script src="js/init.js"></script>

                <script src="js/jquery.dropotron.min.js"></script>
                <script src="js/skel-layers.min.js"></script>

<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-wide.css" />
		</noscript>
		
<style type="text/css">



.wrapper.style1 {
    padding-top: 11em;
    padding-bottom: 24em;
    background-size: cover;
    background-attachment: fixed;
    -webkit-backface-visibility: hidden;
    -webkit-transform: translateZ(0);
}

#header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background: #0F1116;
    color: #fff;
    padding: 1.25em;
    z-index: 100;
}

.box {
    padding: 20px;
    background: #FFF;
    text-align: center;
    border-radius: 5px;
    margin-left: 19px;
}

table {
    width: 75%;
    margin-left: 13em;
    margin-top: 12em;
}

body, input, select, textarea {
    font-size: 12pt;
    line-height: 2.5em;
}

#logo {
    font-size: 2em;
    cursor: default;
}

#nav {
    position: absolute;
    right: 0;
    top: 0;
    cursor: default;
}

.\34 u { 
   width: 13em;
}

.image.featured img {
    display: block;
    width: 90%;
}

.image.featured {
    position: static;
    display: block;
    width: 15em;
    padding: 10px;
    margin: auto;
}

</style>


</head>
<body>

	<%
	    MemberDTO user = (MemberDTO)session.getAttribute("user");	
		Entire_Environment_DTO entire_environment_DTO = null;
		Domestic_AnimalsDTO[] animalsDTOs = null;
		LocalDateTime nearVacDate = LocalDateTime.now().plusYears(1);
		LocalDateTime nearForwadDate = LocalDateTime.now().plusYears(1);
		LocalDateTime today = LocalDateTime.now();
		if(user == null){
			response.sendRedirect("Login.jsp");
		}else{
			
				entire_environment_DTO =  
						(Entire_Environment_DTO)session.getAttribute("StateAllSelect");	
				
				animalsDTOs = 
						(Domestic_AnimalsDTO[])session.getAttribute("animalDB");
				String [][]vacTmpDate = new String[2][3];
				
				
				vacTmpDate[0][0] = animalsDTOs[0].getFir_vaccine();
				vacTmpDate[0][1] = animalsDTOs[0].getSec_vaccine();
				vacTmpDate[0][2] = animalsDTOs[0].getThr_vaccine();
				
				vacTmpDate[1][0] = animalsDTOs[1].getFir_vaccine();
				vacTmpDate[1][1] = animalsDTOs[1].getSec_vaccine();
				vacTmpDate[1][2] = animalsDTOs[1].getThr_vaccine();

			
			
		        
        		
				for(int i = 0; i <2 ; i++){
					for(int j = 0; j <3 ; j++){
						String tmpDate = vacTmpDate[i][j];
						LocalDateTime s = LocalDateTime.parse(tmpDate,DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
						System.out.println(tmpDate);
						if(nearVacDate.isAfter(s) && s.isAfter(today) ){
							nearVacDate= s; 
						}
						
					}	
					String tmpDate = animalsDTOs[i].getForwarding_date();
					LocalDateTime s = LocalDateTime.parse(tmpDate,DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
					
					if(nearForwadDate.isAfter(s) && s.isAfter(today)){
						nearForwadDate= s; 
						System.out.println("����"+nearForwadDate);
					}
				}
			
		}
	
	%>
	<% if(user!=null ){%>

	<div class="wrapper style1">
	

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


		<table>

			<tr>
				<td>
					<section class="4u">
						<a href="#" class="image featured"><img src="images/pic01.png" class="img"></a>
							<span class="box">�µ�:<%=entire_environment_DTO.getTemp() %>��
							����:<%=entire_environment_DTO.getHumi() %>%</span>
						
					</section>
				</td>

				<td>
					<section class="4u">
						<a href="#" class="image featured"><img src="images/pic02.png" class="img" id = "weatherImg"></a>
							<span class= "box">�µ�:<%=entire_environment_DTO.getTemp() %>��
							����:<%=entire_environment_DTO.getHumi() %>%</span>
					</section>
				</td>
			</tr>
			<tr>
				<td>
					<section class="4u">
						<a href="#" class="image featured"><img src="images/pic03.png" class="img"></a>
						<span class= "box">����� ���������</span>
							<span class= "box"><%=nearVacDate.format(DateTimeFormatter.ofPattern("yyyy��MM��dd��")) %></span>
					</section>
				</td>

				<td>
					<section class="4u">
						<a href="#" class="image featured"><img src="images/pic04.png" class="img"></a>
						<span class= "box">����� ���Ͽ�����</span>
							<span class= "box"><%=nearForwadDate.format(DateTimeFormatter.ofPattern("yyyy��MM��dd��")) %></span>
					</section>
				</td>
			</tr>
		</table>

	</div>
	<%} %>
</body>
</html>