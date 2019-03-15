<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<!-- 영화 매인 리스트 디자인 시작-->
	<div class="content_wrap">
		<div class="content_inner">
			<div id="content-5" class="content">
				<ul class="clearfix">
					<c:forEach var="movieList" items="${movieList}">
						<li class="pc_list">
							<a class="front" href="#movie"> 
								<img class="img" src="${pageContext.request.contextPath}/main/img/moviePics&video/${movieList.movie_imageurl}" alt="${movieList.movie_moviename}">
							</a>
							<div class="bg">
								<div class="hide_content table_middle">
									<ul class="table_cell_middle">
										<li>
											<a class="deteilBtn" href="#detail">상세보기</a>
										</li>
										<c:if test="${sessionScope.id == null}">
											<li>
												<a class="clickHand" onclick="login()">예매하기</a>
											</li>
										</c:if>
										<c:if test="${sessionScope.id != null}">
											<li>
												<a class="reserveBtn" href="#reverse">예매하기</a>
											</li>
										</c:if>
									</ul>
								</div>
							</div>
							<div class="title" title="${movieList.movie_moviename}" style="display: none;">
								<h3 class="movieName">${movieList.movie_moviename}</h3>
								<p class="text" style="display: none;">${movieList.movie_content}</p>
							</div></li>
					</c:forEach>
				</ul>
			</div>
			<!-- 영화 매인 리스트 디자인 끝-->
			<!-- 팝업 디자인 시작-->
			<div class="pop_up_bg" style="display: none;">
				<form method="post" action="/Movie/Reserve_Success.movie" id="reserve" class="form_reserve">
					<div class="pop_up_post">
						<div class="pop_up_post_inner clearfix">
							<div class="pop_up_right">
								<div class="cinema_wrapper">
									<h3 id="pop_up_Name" class="tit_26"></h3>
									<h2 class="txt_18">CINEMA</h2>
									<select name="cinema" class="cinema_select" id="cinema">

									</select>
									<div class="d_day_wrapper">
										<h2 class="txt_18">DATE</h2>
										<input type="text" name="time_startdate" id="datepicker" size="30">
									</div>
									<div class="time_wrapper">
										<h2 class="txt_18">TIME</h2>
										<div class="course_sort_wrap">
											<ul id="myselect" class="">
												<li class="time_list cinema_select">
													<a href="#0" class="clearfix" id="time">시간을 선택해주세요</a>
													<ul class="menu_inner" id="timeList">

													</ul>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<!--pop_up 영화 제목 및 토탈 가격 알려줌-->
							<div class="pop_up_left">
								<img id="reserveStillImg" src="" alt="" />
							</div>
							<div class="screen_wrapper"></div>
							<div class="total_wrap">
								<div class="total_inner">
									<p id="" class="txt_14">
										<a class="cancel" href="/Movie/Main.movie"> cancel </a>
									</p>
									<p id="ticketTotalPrice" class="txt_14">
										<a class="total_btn total"> total price<span>0</span>won</a>
									</p>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" name="movie_name" id="movie_name"> 
					<input type="hidden" name="reserve_seatcount" id="reserve_seatcount">
					<input type="hidden" name="reserve_price" id="reserve_price">
					<input type="hidden" name="time_starttime" id="time_starttime">
					<input type="hidden" name="time_screencode" id="time_screencode">
					<input type="hidden" name="adult" id="adult1"> 
					<input type="hidden" name="child" id="child"> 
					<input type="hidden" name="reserve_id" value="${sessionScope.id}">
				</form>
			</div>
			<!-- 팝업 디자인 끝-->
			<!-- 팝업 상세페이지 디자인 시작-->
			<div class="derail_pop_up_wrap" style="display: none">
				<div class="l_wrapper derail_pop_up">
					<div id="movieDetail">
					
					</div>
					<div class="derail_pop_up_footer">
						<div class="derail_pop_up_footer_comments clearfix">
							<h3 class="tit_18">
								한줄평 (<span id="movieCommentTotalCount">0</span>)
							</h3>
							<!--  댓글  -->
							<div class="popup_box clearfix">
								<!-- 댓글 등록 -->
								<div class="input">
									<div class="btn_wrap">
										<c:if test="${sessionScope.id == null}">
											<button class="comment_btn txt_16" value="등록" onclick="login()">등록</button>
										</c:if>
										<c:if test="${sessionScope.id != null}">
											<button id="saveBtn" class="comment_btn txt_16" value="등록">등록</button>
										</c:if>
									</div>
									<div class="textarea">
										<textarea title="댓글쓰기" name="comment" id="review_content" cols="30" rows="10" maxlength="100">
										
										</textarea>
									</div>
								</div>
							</div>
							<!-- 평점 시작 -->
							<div class="rating">
								<div class="my_rate txt_16">
									<div id="rateYo" class="star_rating" style="display: inline-block; width: 100px;"></div>									
									<div id="movieDetailStarScoreTxt" class="star_score txt_14">평점을 입력해주세요.</div>
									<input id="review_score" type="hidden"> 
									<input type="hidden" id="review_id" value="${sessionScope.id}">
								</div>
							</div>
							<!-- 평점 시작 끝-->
							<div id="movieReviewList" class="list_content"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- 팝업 상세페이지 디자인 끝-->
		</div>
	</div>
