<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>영화 삭제</h1>
                <p class="description">영화의 정보를 관리 및 삭제가 가능합니다.</p>
               <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                        					<th>상영코드</th>
                                            <th>영화관</th>
                                            <th>영화</th>
                                            <th>상영관</th>
                                            <th>상영 날짜</th>                                                                                                                  
                                            <th>시작 시간</th>
                                            <th>종료 시간</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="movieList" items="${movieDeleteList}">
                                        <tr class="ee">
                                            <td>${movieList.showingcode}</td>
                                            <td>${movieList.cinemaname}</td>
                                            <td>${movieList.moviename}</td>
                                            <td>${movieList.screencode}</td>
                                            <td>${movieList.startdate}</td>
                                            <td>${movieList.starttime}</td>
                                            <td>${movieList.endtime}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="btn_change">
                    <form method="post" action="admin_MovieDeletePro.movie" id="movieDelete">
                        <ul>
                            <li><a class="clickHand" onclick="deleteMovie()">삭제</a></li>
                            <li><a class="clickHand" onclick="history.back()">취소</a></li>
                        </ul>
                        <input type="hidden" name="showingcode" value="${showingcode}">
                    </form>
                    </div>
                </div>
                <!-- /.container-fluid -->
            <section id="main-content" class="animated fadeInUp">
                <!-- 서브컨텐츠 시작구간 -->
            </section>
        </section>
