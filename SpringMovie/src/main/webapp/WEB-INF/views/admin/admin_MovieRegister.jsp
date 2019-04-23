<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <section class="main-content-wrapper">
           <section id="main-content" class="animated fadeInLeft">
               <div class="pageheader">
                   <h1>영화등록</h1>
                   <p class="description">영화정보를 등록할 수 있습니다.</p>
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
                                <form class="form-horizontal form-border" id="form" method="post" action="admin_MovieRegisterPro.movie" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">영화이름</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="moviename" placeholder="영화이름" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">장르</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="genre" placeholder="장르" required>
                                        </div>
                                    </div>
									<div class="form-group">
                                        <label class="col-sm-3 control-label">개봉</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control date" name="opendate">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">상영시간</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="runningtime" placeholder="상영시간" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">감독</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control"  name="director" placeholder="감독" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">배우</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="actor" placeholder="배우" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">등급</label>
                                        <div class="col-sm-6">
                                           <select class="form-control" name="grade">
                                           	   <option value="">등급을 선택해주세요.</option>
                                               <option>전체 이용가</option>                                              
                                               <option>12세 이용가</option>
                                               <option>15세 이용가</option>
                                               <option>19세 이용가</option>
                                           </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">영화 사진</label>
                                        <div class="col-sm-6">
                                            <input type="file" class="form-control" name="upload" placeholder="사진" required>
                                        </div>
                                    </div>                                   
                                    <!--에디터 글 작성 여부 시작-->
                                    <div class="form-group">
                                        <div>
                                            <div class="panel panel-default">
                                               <label class="col-sm-3 control-label">영화 내용</label>
                                                <div class="col-sm-6">
                                                    <textarea name="content" id="editor1" rows="10" cols="80"></textarea>
                                                </div>
                                                <div class="form-group inner_top">
                                                    <div class="col-sm-offset-3 col-sm-6">
                                                        <button type="submit" class="btn btn-primary">저장</button>
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
