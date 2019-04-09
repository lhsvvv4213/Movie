<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>관리자로 변경</h1>
                <p class="description">회원의 정보를 관리 및 삭제가 가능합니다.</p>
               <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                                        <tr class="ee">
                                            <td>${member.name}</td>
                                            <td>${member.id}</td>
                                            <td>${member.phone}</td>
                                            <td>${member.email}</td>
                                            <td>${member.point}</td>
                                            <td>${member.grade}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="btn_change">
                    <form method="post" action="admin_MemberChangePro.movie" id="adminChange">
                        <ul>
                            <li><a class="clickHand" onclick="change()">변경</a></li>
                            <li><a class="clickHand" onclick="history.back()">취소</a></li>
                        </ul>
                    	<input type="hidden" name="id" value="${member.id}">
                    </form>
                    </div>
                </div>
                <!-- /.container-fluid -->
            <section id="main-content" class="animated fadeInUp">
                <!-- 서브컨텐츠 시작구간 -->
            </section>
        </section>      
