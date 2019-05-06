<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<script type="text/javascript" src="../assets/user/js/checkbox.js"></script>

						 <div class="screen_inner">
                            <!-- 가격 금액 설정 -->
                             <div class="bookingSelectSeatTicket clearfix">
                             	<div class=" bookingSelectSeatTicket_inner">
	                                 <div id="adult" class="tit_16 tit">
	                                     <a href="#" class="cnt_btn minus tit_18">-</a>
	                                     <div class="ticket_inner">
	                                         <label data="12000">성인</label>
	                                         <label class="reserveCnt">0</label>
	                                     </div>
	                                     <a href="#" class="cnt_btn plus tit_18">+</a>
	                                 </div>
	                                 <div id="student" class="tit_16 tit">
	                                    <a href="#" class="cnt_btn minus tit_18">-</a>
	                                    <div class="ticket_inner">
	                                         <label data="8000">청소년</label>
	                                         <label class="reserveCnt">0</label>
	                                     </div>
	                                     <a href="#" class="cnt_btn plus tit_18">+</a>
	                                 </div>
                                 </div>
                             </div>
                             <!-- 좌측 테이블 좌석 영역 -->
                             <div class="screen_img_inner">
	                             <div class="screens_img"></div>
	                             <p class="screen_tit tit_18">SCREEN</p>
	                             <div class="scr_img"></div>
	                             
	                             <div class="jacet_wrap">
	                                 <ul class="screen_number">
	                                     <li class="number">1</li>
	                                     <li class="number">2</li>
	                                     <li class="number">3</li>
	                                     <li class="number">4</li>
	                                 </ul>
	                                 <ul class="screen_line">
	                                     <li class="line">A</li>
	                                     <li class="line">B</li>
	                                     <li class="line">C</li>
	                                 </ul>
									 <tr>
                                        <td>
                                         	<c:forEach var="seat" items="${seat}">
                                         		<c:choose>
													<c:when test="${seat.value == 1}">
													<a class="a_size">
														<img src="../assets/user/img/seat/전체/${seat.key}_on.svg" class="imgSize" alt="reserveSeat" style="border-width: 0px;">
													</a>
													</c:when>
													<c:otherwise>
													<span class="in_icon">
                                                		<input type="checkbox" class="checkbox" name="seat" value="${seat.key}" offsrc="../assets/user/img/seat/off.svg" onsrc="../assets/user/img/seat/click.svg">
                                            		</span>
													</c:otherwise>
												</c:choose>                                      
                                            </c:forEach>
                                        </td>
                                     </tr>
                                        <script>
                                        	imgseat("seat")
                                        </script>
	                             </div>
                             </div>
                         </div>
                         
<script type="text/javascript" src="../assets/user/js/screen1.js"></script>
<script type="text/javascript" src="../assets/user/js/seat.js"></script>
