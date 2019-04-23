<!--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>-->

        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>이벤트 삭제</h1>
                <p class="description">이벤트의 정보를 관리 및 삭제가 가능합니다.</p>
               <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>이벤트코드</th>
                                            <th>제목</th>
                                            <th>시작일</th>
                                            <th>종료일</th>                  
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="ee">
                                            <td>${event.eventcode}</td>
                                            <td>${event.subject}</td>
                                            <td>${event.startdate}</td>
                                            <td>${event.enddate}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="btn_change">
                        <ul>
                            <li><a class="clickHand" href="admin_EventDeletePro.movie?eventcode=${event.eventcode}">삭제</a></li>
                            <li><a class="clickHand" onclick="history.back()">취소</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /.container-fluid -->
            <section id="main-content" class="animated fadeInUp">
                <!-- 서브컨텐츠 시작구간 -->
            </section>
        </section>

