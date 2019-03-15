<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:if test="${authority == '-1'}">
	<script>
		alert('아이디 및 비밀번호를 확인해주세요.')
		history.back()
	</script>
</c:if>
<c:if test="${authority == '0'}">
	<%
		response.sendRedirect(request.getContextPath() + "/admin/admin_Member.movie");
	%>
</c:if>
<c:if test="${authority == '1'}">
	<script>
		location.href = "mainPage.movie"
	</script>
</c:if>