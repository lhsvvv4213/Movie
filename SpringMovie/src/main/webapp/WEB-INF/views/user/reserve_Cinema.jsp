<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<option value="">영화관을 선택해주세요.</option>
	<c:forEach var="cinemaList" items="${cinemaList}">
	<option>${cinemaList.cinemaname}</option>
	</c:forEach>