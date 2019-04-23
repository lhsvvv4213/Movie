<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>공지사항 삭제</h1>
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
                                        <tr class="ee">
                                            <td>${notice.noticecode}</td>
                                            <td>${notice.subject}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="btn_change">
                        <ul>
                            <li><a class="clickHand" href="admin_NoticeDeletePro.movie?noticecode=${notice.noticecode}">삭제</a></li>
                            <li><a class="clickHand" onclick="history.back()">취소</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /.container-fluid -->
            <section id="main-content" class="animated fadeInUp">
                <!-- 서브컨텐츠 시작구간 -->
            </section>
        </section>
