<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:if test="${check == 1}">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>가입완료</title>
<tiles:insertAttribute name="css" />
</head>
<body>
    <div class="bg">
        <div class="l_wrapper">
            <div class="inner">
                <h1 class="logo">
                    <a href="mainPage.movie" class="tit_28">MEMBERS LOGIN</a>
                </h1>
                <ul class="clearfix list">
                    <li class="entry agreement l_col s4">약관동의</li>
                    <li class="entry onjoin l_col s4">정보입력</li>
                    <li class="entry complete l_col s4 active">가입완료</li>
                </ul>
                <form id="myForm" name="fregisterform" method="post" action="mainPage.movie">
                    <section class="welcome_wrapper">
                        <h1 class="tit_26">환영합니다.</h1>
                        <p class="para_14">${name}님의 회원가입을 축하드립니다.<br>
                        영화사의 아이디는 <span class="user_id">${id}</span> 입니다.</p>
                    </section>
                    <input type="submit" class="step_btn btn_bg_redicalRed" value="시작하기"/>
                </form>
            </div>
        </div>
    </div>
<tiles:insertAttribute name="js" />
</body>
</html>
</c:if>
<c:if test="${check == 0}">
	<script>
		alert('작성내용을 확인해주세요.')
		history.back()
	</script>
</c:if>