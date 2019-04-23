<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>공지사항 관리</h1>
                <p class="description">공지사항의 정보를 관리 및 삭제가 가능합니다.</p>
               <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="noticeList" items="${noticeList}">
   											<tr>
   												<td>${noticeList.noticecode}</td>
   												<td>${noticeList.subject}
   													<div class="admin_authority_wrapp">
                                                  		<i class="fa fa-bars icon_right">
                                                        	<div class="admin_authority_inner">
                                                            	<div class="admin_authority">
                                                            		<a href="admin_NoticeDelete.movie?noticecode=${noticeList.noticecode}">공지 삭제</a>
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
        