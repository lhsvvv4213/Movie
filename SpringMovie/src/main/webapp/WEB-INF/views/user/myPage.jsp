<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <!-- 컨텐츠 디자인 시작 -->
        <div class="myPage_wapper">
            <div class="l_wrapper">
                 <div class="myPage_inner">
                    <div class="myPage_user">
                        <div class="user_img">
                            <img src="../assets/user/img/user.svg" alt="사용자 이미지">
                        </div>
                        <h2 class="tit_24" id="member_id">${member.id}</h2>
                        <p class="txt_14">이메일 : <span>${member.email}</span></p>
                        <!-- 포인트 버튼 -->
                        <div class="point_wrap">
                            <div class="point_inner">
                                <p class="txt_14">
                                    <strong class="total_btn tit_22">${member.point}<span>p</span></strong>
                                </p>
                            </div>
                        </div>
                        <!-- 포인트 버튼 끝-->
                    </div>
                    <div id="tabs" class="tabs_user">
                        <ul>
                            <li class="user"><a class="txt_16" href="#tabs-1">개인정보</a></li>
                            <li class="user"><a class="txt_16" href="#tabs-2">영화 예매 내역</a></li>
                        </ul>   
                        <!-- 개인 정보 Tab방식 -->
                        <div id="tabs-1" class="Privacy">
                            <div class="Privacy_inner clearfix">
                                <p class="txt_16">이름:<span>${member.name}</span></p>
                                <p class="txt_16">핸드폰:<span>${member.phone}</span></p>
                            </div>

                        </div>
                        <!-- 개인 정보 Tab방식 끝-->
                        <!-- 예매 내역 Tab방식-->
                        <div id="tabs-2" class="Ticketing">
                            <ul>
                            <c:forEach var="reserveList" items="${reserveList}">
                                <li class="Ticketing_list">
                                    <div class="mypage_movie_list">
                                        <h3 class="tit_20">${reserveList.moviename}</h3>
                                        <ul>
                                            <li>상영관: <span>${reserveList.screencode}</span></li>
                                            <li class="year">관람일: <span>${reserveList.startdate}</span></li>
                                            <li class="time">관람시간: <span>${reserveList.starttime} ~ ${reserveList.endtime}</span></li>
                                            <li>관람인원: <span>${reserveList.seatcount}명</span></li>
                                        </ul>
                                    </div>
                                    <div class="mypage_movie_img">
                                        <img src="../assets/user/img/moviePics/${reserveList.newname}" alt="${reserveList.moviename}">
                                    </div>
                                    <p class="reservation_cancellation">
                                    	<button class="txt_12 clickHand reserveCancel">예매 취소</button>
                                    </p>
                                </li>                                
                            </c:forEach>
                            </ul>
                        </div>
                        <!-- 예매 내역 Tab방식 끝-->
                    </div>
                </div> 
            </div>
        </div>       
		<footer class="footer_bg"></footer>
