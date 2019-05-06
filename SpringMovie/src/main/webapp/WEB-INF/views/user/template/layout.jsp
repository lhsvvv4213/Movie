<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A.MOVIE</title>
<tiles:insertAttribute name="css" />
</head>
<body>
	<div class="bg">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="body" />
	</div>
	<tiles:insertAttribute name="js" />
	<tiles:insertAttribute name="script" />
</body>
</html>