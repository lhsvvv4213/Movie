<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <section class="main-content-wrapper">
           <section id="main-content" class="animated fadeInLeft">
               <div class="pageheader">
                   <h1>영화관 등록</h1>
                   <p class="description">영화관을 등록할 수 있습니다.</p>
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
                                <form class="form-horizontal form-border" enctype="multipart/form-data">
                                    <div class="form-group inner">
                                        <label class="col-sm-3 control-label">영화관 이름</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="cinemaname" placeholder="영화관 이름" required>
                                        </div>
                                    </div>
                                    <div class="form-group inner">
                                        <label class="col-sm-3 control-label">전화번호</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="tel" placeholder="1533-2200" required>
                                        </div>
                                    </div>
                                    <div class="form-group inner">
                                        <label class="col-sm-3 control-label">지역선택</label>
                                        <div class="col-sm-6">
                                           <select class="form-control" name="local">
                                           	   <option value="">지역을 선택해주세요.</option>
                                               <option>서울</option>
                                               <option>경기</option>
                                               <option>인천</option>
                                               <option>강원</option>
                                               <option>대전/충전</option>
                                               <option>광주/전라</option>
                                               <option>대구/울산/부산</option>
                                               <option>경상/제주</option>
                                           </select>
                                        </div>
                                    </div>
                                    <div class="form-group inner">
                                        <label class="col-sm-3 control-label">영화관 사진</label>
                                        <div class="col-sm-6">
                                            <input type="file" class="form-control" name="upload" placeholder="영화관 사진" required>
                                        </div>
                                    </div>
                                    <div class="form-group inner">
                                        <label class="col-sm-3 control-label">영화관 주소</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control text" name="addr" placeholder="영화관 주소" required>
                                        </div>
                                    </div>
                                    <!--에디터 글 작성 여부 시작-->
                                    <div class="form-group">
                                        <div>
                                            <div class="panel panel-default">
                                               <label class="col-sm-3 control-label">영화관 내용</label>
                                                <div class="col-sm-6">
                                                    <textarea name="content" id="editor1" rows="10" cols="80"></textarea>
                                                </div>
                                                <div class="form-group inner_top">
                                                    <div class="col-sm-offset-3 col-sm-6">
                                                        <button type="button" class="btn btn-primary" id="cinema">저장</button>
                                                        <button onclick="history.back(); return false" class="btn btn-primary">취소</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!--에디터 글 작성 여부 끝-->
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>
