<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

					<div class="event_bg">
                        <div class="event_border">
                            <div class="event_tit">
                                <h1 class="tit_24">
                                    	${event.subject}
                                    <p>이벤트 기간 : ${event.startdate} ~ ${event.enddate}</p>
                                </h1>
                            </div>
                        </div>
                        <div class="event_img">
                            <img src="../assets/user/img/eventPics/${event.d_newname}">
                        </div>
                    </div>