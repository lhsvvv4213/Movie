<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <!-- 컨텐츠 디자인 시작 -->
        <div class="notice_wrap">
        	<div class="l_wrapper">
          		<div class="noticeIN">
              		<ul class="clearfix">
                  		<li class="noticeIn_list txt_14">
                      		<p>제목</p>
                      		<p>${notice.subject}</p>
                  		</li>
                  		<li class="noticeIn_list txt_14">
                      		<p>등록일</p>
                      		<p>${notice.writedate}</p>
                  		</li>
             		 </ul>
             	 	<div class="contents">
                 		 ${notice.content}
              		</div>
              		<ul class="board_list_next_prev">
              	  		<c:if test="${next != null}">
              	  		<li class="next ">
                      		<span>다음</span><i class="icon-up-open-big"></i>
                      		<a href="notice_Detail.movie?noticecode=${next.noticecode}" title="${next.subject}">
                          		${next.subject} 
                      		</a>
                  		</li>
                  		</c:if>
                 		 <c:if test="${pre != null}">
                  		<li class="prev">
                     		 <span>이전</span><i class="icon-down-open-big"></i>
                     		 <a href="notice_Detail.movie?noticecode=${pre.noticecode}" title="${pre.subject}">
                         		 ${pre.subject}
                      		</a>
                 		 </li>    
                  		</c:if>            
              		</ul>
          		</div>
        	</div>
        </div>
