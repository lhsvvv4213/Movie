<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

            <!-- 컨텐츠 디자인 시작 -->
            <div class="event_wrap">
                <div class="l_wrapper">
                    <ul class="clearfix event_list_wrap">
                    <c:forEach var="eventEight" items="${eventEight}">
                        <li class="l_col l3 event_list">
                            <a class="eventBtn" href="#event">
                                <img src="../assets/user/img/eventPics/${eventEight.newname}" height="375px" width="253px">
                                <div class="event_inner">
                                    <h2 class="tit_24">
                                        ${eventEight.subject}
                                        <p>${eventEight.startdate} ~ ${eventEight.enddate}</p>
                                    </h2>
                                </div>
                            </a>
                        </li>
	                    <input type="hidden" value="${eventEight.eventcode}">                        
                    </c:forEach>
                    </ul>
                    <!-- 더보기 버튼 -->
                    <c:if test="${count == 8}">
                    <div class="moder_btn">
                        <a href="#0" class="moder">더보기</a>
                    </div>
                    </c:if>
                </div>
            </div>
            <div class="pop_up_bg pop_bg" style="display:none">
                <div class="l_wrapper wrap" id="eventDetail">
                    
                </div>
            </div>
            <!-- 컨텐츠 디자인 끝 -->
            <footer class="event_footer_bg"></footer>
  