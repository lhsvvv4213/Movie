<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<tiles:insertAttribute name="css" />
</head>
<body class="join">
	<div class="l_wrapper">
		<div class="inner">
				<h1 class="logo">
					<a href="mainPage.movie" class="tit_28">MEMBERS LOGIN</a>
				</h1>
				<ul class="clearfix list">
					<li class="entry agreement l_col s4">약관동의</li>
					<li class="entry onjoin l_col s4 active">정보입력</li>
					<li class="entry complete l_col s4">가입완료</li>
				</ul>
				<form method="post" action="register_Success.movie" id="myForm">
					<div class="join_step3">
						<ul>
							<li id="li_id list_input"> 
								<input type="text" name="id" placeholder="아이디" class="join_cheak_id in_e_sel_menu" id="mem_id" minlength="8" maxlength="30" required>
								<button type="button" name="idDuplication" class="id_user tit_14" onclick="idCheck()">중복체크</button>
							</li>
							<li id="li_pw list_input">
								<input type="password" name="pw" placeholder="비밀번호" class="cheakpw in_e_sel_menu" minlength="8" maxlength="20" required>
							</li>
							<li id="li_pw1 list_input">
								<input type="password" placeholder="비밀번호 재확인" class="cheakpw1 in_e_sel_menu" minlength="8" maxlength="20" required>
							</li>
						</ul>
					</div>
					<div class="join_step4">
						<ul>
							<li id="li_name list_input">
								<input type="text" name="name" placeholder="이름" class="cheakname in_e_sel_menu" size="10" maxlength="20" required>              
							</li>
							<li id="li_mail list_input"> 
								<input type="email" name="email" placeholder="abc@abc.com" class="cheakemail in_e_sel_menu" id="mem_email" size="70" maxlength="40" required>
							</li>
							<li id="li_number list_input">
								<input type="text"name="phone" placeholder="핸드폰 번호를 -없이 입력해주세요." class="cheakenumber in_e_sel_menu" maxlength="20" required>
							</li>
						</ul>
					</div>
					<div class="id_users"></div>
					<div class="passwordCheckMessage"></div>
					<input type="submit" class="step_btn btn_bg_redicalRed tit_16" value="동의" onclick="inputCheck()"/>
				</form>
		</div>
	</div>
<tiles:insertAttribute name="js" />
</body>
</html>