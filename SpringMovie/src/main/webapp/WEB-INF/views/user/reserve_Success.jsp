<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<title>예매확인</title>    
<tiles:insertAttribute name="css" />
</head>
<body>
    <div class="bg">
        <div class="l_wrapper">
            <div class="inner">
                <div class="tick_success">
                    <h1 class="tit_28">THANK YOU</h1>
                    <p>성공적으로 티켓을 구매했습니다.</p>
                </div>
                <div class="tick_wapper">
                    <div class="tick_inner">
                        <div class="tick_movie_wapper clearfix">
                            <div class="movie_tit tit_22">
                                <p>Title</p>
                                <h2 class="">${movie}
                                    <p></p>
                                    <p class="tick_theater">극장명: ${cinema}</p>
                                </h2>
                                
                            </div>
                            <div class="tick_day l_col l6">
                                <h2 class="tit_20">Date
                                    <p class="color">${startdate}</p>
                                </h2>
                            </div>
                            <div class="tick_time l_col l6">
                                <h2 class="tit_20">Time
                                    <p class="color txt_16">${starttime}</p>
                                </h2>
                            </div>
                        </div>
                        <div class="tick_movie_wapper">
                            <div class="tick_personnel">
                                <h2 class="tit_20">
                                    Selective personnel
                                    <div class="color">${seatcount}명
                                        <span class="color">(성인 : ${adult}명 / 청소년 : ${child}명)</span>
                                    </div>
                                </h2>
                            </div>
                        </div>
                        <div class="tick_movie_wapper">
                            <div class="tick_personnel">
                                <h2 class="tit_20">Seat number
                                    <div class="seat">
                                        <span class=" color">${screencode}</span>
                                        <span class=" color">${seatNum}</span>
                                    </div>
                                </h2>
                            </div>
                        </div>
                    </div>
                    <div class="tick_inner two">
                        <div class="tick_movie_wapper">
                            <h2 class="tit_20">Total
                                <p>${priceComma}원</p>
                            </h2>                            
                        </div>
                    </div>
                </div>
                <!--가격버튼  -->
                <div class="total_wrap">
                     <div class="success_inner">
                     <p class="txt_14">
                           <a href="mainPage.movie" class="success_btn total_btn txt_16">
                            확인
                         </a>
                     </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<tiles:insertAttribute name="js" />
</body>
</html>