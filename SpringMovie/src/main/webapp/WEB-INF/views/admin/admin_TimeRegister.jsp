<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <section class="main-content-wrapper">
           <section id="main-content" class="animated fadeInLeft">
               <div class="pageheader">
                   <h1>시간 등록</h1>
                   <p class="description">영화시간을 등록할 수 있습니다.</p>
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
                                <form class="form-horizontal form-border">
                                    <div class="form-group inner">
                                        <label class="col-sm-3 control-label">상영 영화관</label>
                                        <div class="col-sm-6">
                                            <select class="form-control" name="cinemaname" id="cinema">
                                            	<option value="">영화관을 선택해주세요.</option>
                                            <c:forEach var="cinemaList" items="${cinemaList}">
                                                <option>${cinemaList.cinemaname}</option>
                                            </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group inner">
                                        <label class="col-sm-3 control-label">상영 영화</label>
                                        <div class="col-sm-6">
                                            <select class="form-control" name="moviename">
                                            	<option value="">영화를 선택해주세요.</option>
                                            <c:forEach var="movieList" items="${movieList}">
                                                <option>${movieList.moviename}</option>
                                            </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                     <div class="form-group inner">
                                        <label class="col-sm-3 control-label">상영관</label>
                                        <div class="col-sm-6">
                                            <select class="form-control" name="screencode" id="screen">
                                            	<option value="">상영관을 선택해주세요.</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group inner">
                                        <label class="col-sm-3 control-label">상영 날짜</label>
                                        <div class="col-sm-6">
                                           <input type="text" class="form-control date" name="startdate" placeholder="상영 날짜" required>
                                        </div>
                                    </div>
                                    <div class="form-group inner">
                                        <label class="col-sm-3 control-label">시작 시간</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control text" name="starttime" placeholder="시작 시간" required>
                                        </div>
                                    </div>
                                    <div class="form-group inner">
                                        <label class="col-sm-3 control-label">종료 시간</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control text" name="endtime" placeholder="종료 시간" required>
                                        </div>
                                    </div>
                                    <div class="form-group inner_top">
                                        <div class="col-sm-offset-3 col-sm-6">
                                            <button type="button" class="btn btn-primary" id="time">저장</button>
                                            <button onclick="history.back(); return false" class="btn btn-primary">취소</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>
