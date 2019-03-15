//아이디 중복체크 ajax 구현 함수
function idCheck() {
    var id = $('#mem_id').val();
    
    if ((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
        alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
        $('#mem_id').val('')
        $('#mem_id').focus()
    } else {
    	$.ajax({
    		type:"post",
    		url: "idCheck.movie",
    		data: { id: id },
    		success: function (data) {
    			if (data == 0) {
    				$('.id_user').prop('checked', true);
    				$('.id_users').css({
    					'color': 'blue',
    					'font-size': '14px'
    				}).text('사용할 수 있는 아이디 입니다.');
    			} else {
    				$('.id_user').prop('checked', false);
    				$('.id_users').css({
    					'color': 'red',
    					'font-size': '14px'
    				}).html('사용할 수 없는 아이디 입니다.');
    			}
    		}
    	});
    }
}

//회원가입 입력 받을때 값이 비어 있으면 경고창 띄어주는 함수
function inputCheck() {
    var chk = $('.id_user').prop('checked');
    
    //비밀번호 확인, 서로 일치하지하는지 체크 하는 함수
    if ($('.cheakpw').val() != $('.cheakpw1').val()) {
        $('.passwordCheckMessage').css({
            'color': 'red',
            'font-size': '14px',
            'margin-top': '10px'
        }).html('비밀번호가 서로 일치하지 않습니다.');
            $('.cheakpw1').focus();
            return false;
        } else {
            $('.passwordCheckMessage').html('');
        }
    
    // 실제 DB와 연결시에는 submit 함수와, alert함수가 반대로 작성해야지만 논리적으로 말이 맞다.
    if (chk == true && !$('#mem_email').attr('required', true)){
    	$('#myForm').submit();      
    } else if (chk == undefined && $('#mem_id').val() != ''){
    	alert('아이디 중복체크를 해주세요.');
    }
}

function login() {
	alert('로그인 후에 이용할 수 있습니다.')
	return false;
}

function memberId_submit(id, url) {
    var form = document.createElement("form");

    form.setAttribute("charset", "UTF-8");
    form.setAttribute("method", "Post");
    form.setAttribute("action", url);

    var hiddenField = document.createElement("input");

    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "member_id");
    hiddenField.setAttribute("value", id)

    form.appendChild(hiddenField);

    document.body.appendChild(form);

    form.submit();
}

function cancel(id, date, time, screen, count, url) {
    var form = document.createElement("form");

    form.setAttribute("charset", "UTF-8");
    form.setAttribute("method", "Post");
    form.setAttribute("action", url);

    var hiddenField = document.createElement("input");

    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "reserve_id");
    hiddenField.setAttribute("value", id)
    
    var hiddenField1 = document.createElement("input");

    hiddenField1.setAttribute("type", "hidden");
    hiddenField1.setAttribute("name", "time_startdate");
    hiddenField1.setAttribute("value", date)
    
    var hiddenField2 = document.createElement("input");

    hiddenField2.setAttribute("type", "hidden");
    hiddenField2.setAttribute("name", "time_starttime");
    hiddenField2.setAttribute("value", time)
    
    var hiddenField3 = document.createElement("input");

    hiddenField3.setAttribute("type", "hidden");
    hiddenField3.setAttribute("name", "time_screencode");
    hiddenField3.setAttribute("value", screen)
    
    var hiddenField4 = document.createElement("input");

    hiddenField4.setAttribute("type", "hidden");
    hiddenField4.setAttribute("name", "reserve_seatcount");
    hiddenField4.setAttribute("value", count)

    form.appendChild(hiddenField);
    form.appendChild(hiddenField1);
    form.appendChild(hiddenField2);
    form.appendChild(hiddenField3);
    form.appendChild(hiddenField4);

    document.body.appendChild(form);

    form.submit();
}

$(document).ready(function () {
	
	$('#mem_id').focus()		
	$('#mem_name').focus()		
	
//mobile,pc 로그인 버튼 클릭하면 사이드 바 나오는 이벤트
$('.large_contents:eq(4)').click(function () {
    $('.form_wrapper').addClass('active');
});

//mobile,pc 윈도우 흰색 바탕 버튼 클릭하면 사이드 바 사라지는 이벤트 **$(e.target).hasClass()는 자식에게 다이랙트로 식별한다.**
$(document).on('click', function(e) {
    if (!$(e.target).hasClass('tit_16') && !$(e.target).hasClass('table_cell_middle') && !$(e.target).hasClass('table_middle') && !$(e.target).hasClass('form_wrapper active') && !$(e.target).hasClass('txt_14') && !$(e.target).hasClass('tit_28') && !$(e.target).hasClass('in_e_Dpink') && !$(e.target).hasClass('login_btn')) {
        $('.form_wrapper').removeClass('active');
    }
});

//index 페이지 가로 스크롤 작업
    $("#content-5").mCustomScrollbar({
        axis: "x",
        theme: "dark-thin",
        autoExpandScrollbar: true,
        advanced: { autoExpandHorizontalScroll: true }
    });
    
//index 페이지 작업
    $(".pc_list").on({
        mouseenter:function(){
            $(this).find('.table_cell_middle a').show(100);
            $(this).find('.bg').fadeIn();
            $(this).find('.bg').addClass('active');
        },
        mouseleave:function() {
            $(this).find('.bg').removeClass('active');
            $(this).find('.bg').hide();
            $(this).find('.table_cell_middle a').hide();
        }
    });   

    //index 페이지 윈도우 클릭시 pop_up 사라짐
    $(document).on('click', function(e){
        if($(e.target).hasClass('pop_up_bg') == true || $(e.target).hasClass('form_reserve') == true){
            $('.pop_up_bg').fadeOut();
            $('.pop_up_post_inner').css('height','440px');
            $('.menu_inner').hide(150);
            $('body').removeClass('modal_open', 10);
        }else if($(e.target).hasClass('derail_pop_up_wrap') == true){
        	$('.derail_pop_up_wrap').fadeOut();
        }
    });
    
    // jquery ui 현재 날짜 찍어주기
    $("#datepicker").datepicker({
        firstDay: 1,
        dateFormat: "yy-mm-dd",
        onSelect:function(){
           $('.menu_inner li').empty()
           $(".pop_up_post_inner").css('height','440px');
        } 
     }).datepicker("setDate", "0");
    
    // 상세페이지 별점 측정 객체를 생성하여 변수에 담는다. $rateYo 
    var $rateYo = $("#rateYo").rateYo({
        rating: 2,
        fullStar: true,
        readOnly: false,
        ratedFill: "#ed3c5f",
        //mousemove 이벤트 발생, 첫번째 score 의 값으로 점수를 매길 수 있다
            onChange: function (score) {
                // 점수에 따라 문자를 변경해준다
                var txt = "";
                var val = "";
                if (score == 0) {
                    val = 0;                  
                }
                else if (score == 1) {
                    txt = "괜히봤어요";
                    val = 1;
                }
                else if (score == 2) {
                    txt = "기대하진 말아요";
                    val = 2;
                }
                else if (score == 3) {
                    txt = "무난했어요";
                    val = 3;
                }
                else if (score == 4) {
                    txt = "기대해도 좋아요!";
                    val = 4;
                }
                else if (score > 4) {
                    txt = "너무 멋진 영화였어요!";
                    val = 5;
                }
                $("#movieDetailStarScoreTxt").text(txt);
                $("#review_score").val(val);
            }
    });
    var rating = $rateYo.rateYo("rating");
    $('#review_score').val(rating);


    // 댓글 기능
    $('#saveBtn').click(function (){
        var content = $('#review_content').val();
        if(content == ""){
            alert("댓글을 입력하세요!");
            return;
        } else {        
		var review_score = $('#review_score').val()
		var review_content = $('#review_content').val()
		var review_id = $('#review_id').val()
		var review_moviename = $('#reserveDetaileName').text()

		$.ajax({
			type : 'post',
			url : '/Movie/Review.movie',
			data : {review_id : review_id, review_score : review_score, review_content : review_content, review_moviename: review_moviename},
			success : function(data) {
				if (data == 0) {
					alert('리뷰는 한번만 남길 수 있습니다.')
					$('#review_content').val('').focus()
				} else {
					$('#review_content').val('').focus()
					review_moviename = review_moviename.replace(/\s/gi,'%20')
					$('#movieReviewList').load('/Movie/ReviewList.movie?review_moviename=' + review_moviename)
				}
			}
		})
        }
    });

    // 상세보기 클릭
    $('.deteilBtn').on('click', function () { 
        $('.derail_pop_up_wrap').fadeIn();
        
		var button = $(this)
		var moviename = button.closest('.bg').next().find('.movieName').text()
		
		moviename = moviename.replace(/\s/gi,'%20')
				
		$('#movieDetail').load('/Movie/Movie_Detail.movie?moviename=' + moviename)
		$('#movieReviewList').load('/Movie/ReviewList.movie?review_moviename=' + moviename)
    });
    
	// 예매하기 클릭
	$('.reserveBtn').click(function() {
		
		$('.pop_up_bg').fadeIn();

        var movieImage = $(this).closest('.pc_list').find('.front > .img').attr('src');
        var movieName = $(this).closest('.pc_list').find('.front > .img').attr('alt');
        $('#reserveStillImg').attr('src',movieImage);
        $('#reserveStillImg').attr('alt',movieName);
        
		var button = $(this)
		var moviename = button.closest('.bg').next().find('.movieName').text()
		
		moviename = moviename.replace(/\s/gi,'%20')
		
		$('#cinema').load('/Movie/Reserve_Cinema.movie?moviename=' + moviename)

	})
	
	// 시간정보 가져오기
	$('#time').click(function() {
		var cinema = $('#cinema option:selected').text()
		var date = $('#datepicker').val()
		var movie = $('#reserveStillImg').attr('alt')

		cinema = cinema.replace(/\s/gi,'%20') 
		movie = movie.replace(/\s/gi,'%20') 
		
		$('#timeList').load('/Movie/Reserve_Time.movie?cinemaname=' + cinema + '&moviename=' + movie + '&opendate=' + date)
		
	});
	
	// 영화관 변경시 리셋
	$('#cinema').change(function(){
        $('.pop_up_time').hide();
        $('.' + $(this).val()).show();
    });
	 
	// 예매완료
	$('.total').click(function() {
			
		var checkCnt = $('input:checkbox[name=seat]:checked').length;
		var result = parseInt($('.reserveCnt').eq(0).text()) + parseInt($('.reserveCnt').eq(1).text());

		$('#movie_name').val($('#reserveStillImg').attr('alt'))
		$('#reserve_seatcount').val(result)
		$('#reserve_price').val(uncomma($('#ticketTotalPrice').find('span').text()))
		$('#time_starttime').val($('.active').find('.menu').text().substr(0, 5))
		$('#time_screencode').val($('.active').find('.theater').text())
		$('#adult1').val($('.reserveCnt').eq(0).text())
		$('#child').val($('.reserveCnt').eq(1).text())

		if(checkCnt == 0) {
			alert('좌석을 선택해주세요.')
			return
		} else if(checkCnt != result) {
			alert('좌석 수를 확인해주세요.')
			return
		} else {
			$('#reserve').submit()
		}		
	})	 
	
	// 이벤트 페이지 팝업
	$('.event_wrap').on('click', '.event_list', function(){
		
        $('.pop_up_bg').fadeIn();
        $('body').addClass('modal_open');
        
		var button = $(this)
		var eventcode = button.closest('.event_list').next().val()
		
		$('#eventDetail').load('/Movie/Event_Detail.movie?eventcode=' + eventcode)
    });
	
	// 이벤트 더보기
	$('.moder_btn .moder').click(function(){
    	
        $.ajax({
            url: "/Movie/Event_More.movie",        
            success: function (result) {
                $('.event_list_wrap').append(result);
                
                 // 이벤트 페이지 무한 스크롤
                $('.moder').hide("slow", function(){
                	$(window).scroll(function (e) {
                		var scrollHeight = $(window).scrollTop() + $(window).height(); //브라우저의 뷰포트의 높이를 돌려줍니다.(가변값)
                		var documentHeight = $(document).height(); //HTML 문서의 높이를 반환합니다.(고정값)          
                	}); 
                });
            }
        });
	});
	
	// 마이페이지 이동
	$('.mypage').click(function() {
		
		var member_id = $('#mypage').val()
		var url = '/Movie/Mypage.movie'
		
		memberId_submit(member_id, url)
	})
	
	var current = new Date()
	
	$('.Ticketing_list').find('.year').each(function(i) {
        var current_year = $(this).text().substr(5)
     	var current_time = $('.Ticketing_list').find('.time').eq(i).text().substr(6, 5)           	
		var reserve_time = current_year + ' ' + current_time				
     	var time = new Date(new Date(Date.parse(reserve_time) - 1000 * 60 * 30)) // 영화시작시간에서 30분 빼기

     	if(current > time) { // 현재시간이 영화시작시간에서 30분 뺀 것보다 빠르다면 예매취소 불가능
     	 	$('.reserveCancel').eq(i).css('background-color','#465062').click(function() {
     	 		alert('영화시작 30분전에는 영화취소가 불가능합니다.');
     	 	})
     	} else {
     		$('.reserveCancel').click(function() {
            	
     	        var button = $(this)
     	        var id = $('#member_id').text()
     	        var date = button.closest('.Ticketing_list').find('li').eq(1).text().substr(5)
     	        var time = button.closest('.Ticketing_list').find('li').eq(2).text().substr(6, 5)
     	        var screen = button.closest('.Ticketing_list').find('li').eq(0).text().substr(5)
     	        var count = button.closest('.Ticketing_list').find('li').eq(3).text().substr(6, 1)
     	        var url = '/Movie/Reserve_Cancel.movie'
     	        	
     	        cancel(id, date, time, screen, count, url)
     	     })
     	} 
    })        
	 
});
