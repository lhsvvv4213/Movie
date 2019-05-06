<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <section class="main-content-wrapper">
           <section id="main-content" class="animated fadeInLeft">
               <div class="pageheader">
                   <h1>공지사항 등록</h1>
                   <p class="description">공지사항을 등록할 수 있습니다.</p>
               </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="actions pull-right">
                                    <i class="fa fa-expand"></i>
                                    <i class="fa fa-chevron-down"></i>
                                    <i class="fa fa-times"></i>
                                </div>
                            </div>
                            <div class="panel-body">
                                <form class="form-horizontal form-border" method="post" action="admin_NoticeRegisterPro.movie">
                                    <div class="form-group inner">
                                        <label class="col-sm-3 control-label">공지사항 제목</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control text" name="subject" placeholder="공지사항 제목" required>
                                        </div>
                                    </div>
                                    <!--에디터 글 작성 여부 시작-->
                                    <div class="form-group">
                                        <div>
                                            <div class="panel panel-default">
                                               <label class="col-sm-3 control-label">공지사항 내용</label>
                                                <div class="col-sm-6">
                                                    <textarea name="content" id="editor1" rows="10" cols="100"></textarea>
                                                </div>
                                                <div class="form-group inner_top">
                                                    <div class="col-sm-offset-3 col-sm-6">
                                                        <button type="submit" class="btn btn-primary" id="notice">저장</button>
                                                        <button onclick="history.back(); return false" class="btn btn-primary">취소</button>
                                                        <input type="hidden" name="id" value="${sessionScope.id}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>
