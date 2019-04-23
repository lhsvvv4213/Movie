<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>영화 관리</h1>
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
                                    	<c:forEach var="movieJoin" items="${movieJoin}">
                                        <tr>
                                        	<td>${movieJoin.showingcode}</td>
                                            <td>${movieJoin.cinemaname}</td>
                                            <td>${movieJoin.moviename}</td>
                                            <td>${movieJoin.screencode}</td>
                                            <td>${movieJoin.startdate}</td>
                                            <td>${movieJoin.starttime}</td>
                                            <td>${movieJoin.endtime}
                                                <div class="admin_authority_wrapp">
                                                    <i class="fa fa-bars icon_right">
                                                        <div class="admin_authority_inner">
                                                            <div class="admin_authority">
                                                            	<a href="admin_MovieDelete.movie?showingcode=${movieJoin.showingcode}">영화 삭제</a>
                                                            </div>
                                                        </div>
                                                    </i>
                                                </div>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            <section id="main-content" class="animated fadeInUp">
                <!-- 서브컨텐츠 시작구간 -->
            </section>
        </section>
