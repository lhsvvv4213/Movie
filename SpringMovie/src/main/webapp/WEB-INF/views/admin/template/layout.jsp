<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>A.MOVIE</title>
<tiles:insertAttribute name="css" />
</head>
<body>
    <section id="main-wrapper" class="theme-default">
	 	<tiles:insertAttribute name="header" />     
		<tiles:insertAttribute name="nav" />       
		<tiles:insertAttribute name="body" />
    </section>
	<tiles:insertAttribute name="js" />
	<tiles:insertAttribute name="script" />
</body>
</html>
