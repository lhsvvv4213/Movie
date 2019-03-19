<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>회원관리</h1>
                <p class="description">회원의 정보를 관리 및 삭제가 가능합니다.</p>
               <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" align="center" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>이메일</th>
                                            <th>핸드폰</th>
                                            <th>포인트</th>
                                            <th>권한</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="member" items="${memberList}">
   											<tr>
   												<td>${member.name}</td>
   												<td>${member.id}</td>
   												<td>${member.email}</td>
   												<td>${member.phone}</td>
   												<td>${member.point}</td>
   												<td>${member.grade}
   													<div class="admin_authority_wrapp">
                                                  		<i class="fa fa-bars icon_right">
                                                        	<div class="admin_authority_inner">
                                                            	<div class="admin_authority">
                                                            		<a class="updateBtn">관리자 변경</a>
                                                            	</div>
                                                            	<div class="admin_authority">
                                                            		<a class="deleteBtn">회원 삭제</a>
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
        <!--main content end-->
