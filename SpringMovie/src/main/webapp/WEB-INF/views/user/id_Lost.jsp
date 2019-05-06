<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<title>아이디 찾기</title>
<tiles:insertAttribute name="css" />
</head>
<body>
	<div class="bg">
		<div class="l_wrapper">
			<div class="inner">
				<h1 class="logo">
					<a href="mainPage.movie" class="tit_28">MEMBERS LOGIN</a>
				</h1>
				<section class="id_Find">
					<h2 class="tit_16">아이디찾기</h2>
					<h3 class="txt_18">이메일로 찾기</h3>
				</section>
				<form>
					<section id="myForm">
						<input type="text" name=name placeholder="이름" class="in_e_redicalRed in_e_sel_menu" id="mem_name" maxlength="20" required> 
						<input type="email" name=email placeholder="abc@abc.com" class="in_e_redicalRed in_e_sel_menu" maxlength="40" required> 
						<input type="text" name=phone placeholder="휴대폰 번호는 -없이 입력해주세요." class="in_e_redicalRed in_e_sel_menu" maxlength="20" required> 
						<input type="button" class="btn_bg_redicalRed btn_layer tit_16 clickHand" id="idSearch" value="확인">
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
