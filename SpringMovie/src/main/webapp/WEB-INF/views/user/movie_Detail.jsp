<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

					<div class="derail_pop_up_header clearfix">
                        <div class="derail_pop_up_left">
                            <div class="tit_26">
                                <p class="derail_pop_bg">${movie.grade}</p>
                                <h2 id="reserveDetaileName" class="derail_pop_tit">${movie.moviename}</h2>
                            </div>
                        </div>
                        <div class="derail_pop_up_right">
                        <c:if test="${sessionScope.id == null}">
                        	<li><a class="clickHand" onclick="login()">예매하기</a></li>                           
                        </c:if>
                        <c:if test="${sessionScope.id != null}">
                        	<li><a class="txt_14 reserveBtn1" href="#reserve">예매하기</a></li>
                        </c:if>
                        </div>
                    </div>
                    <div class="derail_pop_up_contents">
                        <div class="derail_pop_up_infort">
                            <div class="derail_pop_up_inner">
                                <p class="txt_14">개봉일 : <span>${movie.opendate}</span></p>
                                <p class="txt_14">개발기간 : <span>${movie.genre}</span></p>
                                <p class="txt_14">개발인원 : <span>${movie.director}</span></p>
                                <p class="txt_14">개발분야 : <span>${movie.actor}</span></p>
                                <p class="txt_14">개발언어 : <span>${movie.runningtime}</span></p>                              
                            </div>
                            <div class="rating_btn_right txt_18">
                                <a href="#0"><i class="icon-heart"></i>보고싶어</a>
                                <a href="#0">상영시간표</a>
                            </div>
                            <!-- 영화 줄거리 내용 시작-->
                            <div id="movieCommentList" class="list_movie">
                                <div class="item">
                                    <div class="tit_24">
                                    <h3>내용</h3>   
                                    ${movie.content}                                    
                                    </div>
                                </div>
                            </div>
                            <!-- 영화 줄거리 내용 끝-->
                        </div>
                        <div class="derail_pop_up_img">
                            <img id="reserveDetaileImg1" src="../assets/user/img/moviePics/${movie.newname}" alt="${movie.moviename}">
                        </div>                    
                    </div>
                    
<script>
$('.reserveBtn1').click(function(){

	$('.derail_pop_up_wrap').fadeOut();
    $('.pop_up_bg').fadeIn();

    var movieImage = $('#reserveDetaileImg1').attr('src');
    var moviename = $('#reserveDetaileImg1').attr('alt');
    
    $('#reserveStillImg').attr('src',movieImage);
    $('#reserveStillImg').attr('alt',moviename);
    
	moviename = moviename.replace(/\s/gi,'%20')
	
	$('#cinema').load('reserve_Cinema.movie?moviename=' + moviename)
});
</script>
       