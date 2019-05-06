<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<title>비밀번호 찾기</title>
<tiles:insertAttribute name="css" />
</head>
<body>
	<div class="bg">
		<div class="l_wrapper">
			<div class="inner">
				<h1 class="logo">
					<a href="mainPage.movie" class="tit_28">MEMBERS LOGIN</a>
				</h1>
				<section class="password_Find">
					<h2 class="tit_16">비밀번호 찾기</h2>
					<h3 class="txt_18">이메일로 찾기</h3>
				</section>
				<form>
					<section id="myForm">
						<input type="text" name="id" placeholder="아이디" class="in_e_redicalRed in_e_sel_menu" id="mem_id" minlength="8" maxlength="30" required> 
						<input type="email" name="email" placeholder="abc@abc.com" class="in_e_redicalRed in_e_sel_menu" maxlength="40" required>
						<input type="button" class="btn_bg_redicalRed btn_layer clickHand" id="passwordSearch" value="확인">
						<div class="login_bottom clearfix">
							<div class="login_left">
								<a href="id_Lost.movie" class="btn_findid txt_14">아이디찾기</a>
								<a href="password_Lost.movie" class="btn_findpw txt_14">비밀번호찾기</a>
							</div>
							<div class="login_right">
								<a href="agreement.movie"><i class="icon-ok-circled2 txt_16"></i></a> 
								<a href="agreement.movie" class="btn_join txt_14">회원가입</a>
							</div>
						</div>
					</section>
				</form>
			</div>
		</div>
	</div>
	<tiles:insertAttribute name="js" />
</body>
</html>