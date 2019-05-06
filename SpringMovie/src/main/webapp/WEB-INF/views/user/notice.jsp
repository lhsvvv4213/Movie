<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <!-- 컨텐츠 디자인 시작 -->
        <div class="notice_wrap">
            <div class="l_wrapper">
                <table id="table_id" class="display">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>제목</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="noticeList" items="${noticeList}">
                        <tr>
                            <td align="center">${noticeList.noticecode}</td>
                            <td>${noticeList.subject}</td>
                            <td align="center">${noticeList.writedate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 컨텐츠 디자인 끝 -->
		<footer class="footer_bg"></footer>