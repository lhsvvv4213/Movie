<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:if test="${not empty search}">
	<script>
		alert('작성 내용을 확인해주세요.')
		history.back()
	</script>
</c:if>