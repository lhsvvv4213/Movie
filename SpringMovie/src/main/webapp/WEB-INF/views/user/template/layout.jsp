<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A.MOVIE</title>
<tiles:insertAttribute name="css" />
</head>
<body>
	<!--헤더 디자인 시작-->
	<header class="header_pc">
		<div class="l_wrapper">
			<nav>
				<ul class="list_inner">
					<li class="large_contents">
						<a class="tit_16" href="mainPage.movie">Movie</a>
					</li>
					<li class="large_contents">
						<a class="tit_16" href="/Movie/Notice.movie">Notice</a>
					</li>
					<li class="large_contents">
						<a class="tit_16" href="/Movie/Event.movie">Event</a>
					</li>
					<c:if test="${sessionScope.member_id == null}">
						<li class="large_contents">
							<a class="tit_16 clickHand" onclick="login()">My Page</a>
						</li>
						<li class="large_contents">
							<a class="tit_16" href="#login">Login</a>
						</li>
					</c:if>
					<c:if test="${sessionScope.member_id != null}">
						<li class="large_contents">
							<a class="tit_16 clickHand mypage">MyPage</a>
						</li>						
						<li class="large_contents">
							<a class="tit_16" href="/Movie/Logout.movie">Logout</a>
						</li>
						<input type="hidden" value="${sessionScope.member_id}" id="mypage">
					</c:if>
				</ul>
				<a class="tit_24 login" href="#A.MOVIE">A.MOVIE</a>
			</nav>
		</div>
		<!-- 로그인 작업 시작 -->
		<div class="form_wrapper">
			<form method="post" action="/Movie/LoginPro.movie"
				class="table_middle fld">
				<div class="table_cell_middle input_wh">
					<h3 class="tit_28">Login</h3>
					<div class="input_inner">
						<input type="text" name="member_id" placeholder="아이디" required class="inp in_e_Dpink txt_14">
					</div>
					<div class="input_inner">
						<input type="password" name="member_pw" placeholder="비밀번호" required class="inp in_e_Dpink txt_14">
					</div>
					<div class="login_btn_inner">
						<p class="clearfix">
							<a class="txt_14" href="agreement.movie">회원가입</a>
						</p>
						<p>
							<a class="txt_14" href="/Movie/Id_Lost.movie">아이디</a>
						</p>
						<span class="txt_14">.</span>
						<p>
							<a class="txt_14" href="/Movie/Password_Lost.movie">비밀번호 찾기</a>
						</p>
						<input type="submit" class="login_btn" value="Login">
					</div>
				</div>
			</form>
		</div>
		<!-- 로그인 작업 끝 -->
	</header>
	<tiles:insertAttribute name="body" />
<tiles:insertAttribute name="js" />
</body>
</html>