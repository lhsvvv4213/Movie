<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<ul class="item">
	<c:forEach var="reviewList" items="${reviewList}">
		<li>
			<div class="photo_profile">
				<img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" alt="interpret** 프로필사진 없음">
			</div>
			<div class="text">
				<div class="name_inner">
					<div class="name">
						<strong>${reviewList.id}</strong> <span><fmt:formatDate value="${reviewList.writedate}" pattern="yyyy-MM-dd HH:mm:ss"/>   </span>
						<div class="ratingee">
							<div class="my_rate1 txt_16">
								<div class="rateYoee" style="display: inline-block; width: 100px;"></div>
								<input type="hidden" class="score" value="${reviewList.score}">
							</div>
						</div>
					</div>
					<p>
						<span class="comment">${reviewList.content}</span>
					</p>
				</div>
			</div>
		</li>
	</c:forEach>
</ul>
<script>
$('.score').each(function(index) {

	var rating = $(this).val()

	$('.rateYoee').eq(index).rateYo({
		rating : rating,
		readOnly : true, //별칭 고정시킨다.
		ratedFill : "#ed3c5f"
	})
})
</script>