<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:forEach var="eventMore" items="${eventMore}">
	<li class="l_col l3 event_list">
		<a class="eventBtn" href="#event">
			<img src="../assets/user/img/eventPics/${eventMore.newname}" height="375px" width="253px">
				<div class="event_inner">
					<h2 class="tit_24">
						${eventMore.subject}
						<p>${eventMore.startdate}~ ${eventMore.enddate}</p>
					</h2>
				</div>
			</a>
		</li>
	<input type="hidden" value="${eventMore.eventcode}">
</c:forEach>