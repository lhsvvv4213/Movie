<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<option value="">상영관을 선택해주세요.</option>
<c:forEach var="screenList" items="${screenList}">
<option>${screenList.screencode}</option>
</c:forEach>