<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="timeList" items="${movieTimeList}">
	<li class="pop_up_time clearfix" >
		<div class="menu">${timeList.starttime} ~ ${timeList.endtime}</div>
		<div class="menu_room">
			<p class="theater">${timeList.screencode}</p>
		</div>
	</li>
</c:forEach>

<script>
	// 시간 안에 항목들 클릭하면  드롭업하고, 스크린 항목 드롭다운 이벤트 시작
	$(".menu_inner li").click(function() {
		$(this).addClass('active');
		$(this).siblings().removeClass('active');
		
		var date = $('#datepicker').val();
		var time = $(this).find('.menu').text().substr(0, 5);
		var screen = $(this).find('.theater').text();
		
		screen = screen.replace(/\s/gi,'%20')
		$('.screen_wrapper').load('screen.movie?startdate=' + date + '&starttime=' + time + '&screencode=' + screen)
		
		$(".pop_up_post_inner").slideDown('fast', function() {
			$(this).css('height', '1030px');
		});
	});
</script>