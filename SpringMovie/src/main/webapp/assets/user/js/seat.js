	// 체크박스 이벤트 구분
	$(".imgSize").click(function(){
		
		if($(this).attr('alt') == "reserveSeat") {
			return;
		} 
		
	    var reserveCnt = 0;
	    reserveCnt += parseInt($('.reserveCnt:eq(0)').text());
	    reserveCnt += parseInt($('.reserveCnt:eq(1)').text());
	    
		var checkCnt = $('input:checkbox[name=seat]:checked').length; // 체크된 체크박스의 개수
		var index =  $('img[alt=spaceSeat]').index(this);
 
	    if (reserveCnt == 0) {
	        alert('인원수부터 선택해주세요');;
	        $(this).attr('src', './main/img/seat/off.svg');     	 
	        $('.checkbox').attr('checked', false);
	        return;
	    } else if(checkCnt > reserveCnt) {
	    	$(this).attr('src', './main/img/seat/off.svg');
	        $('.checkbox:eq('+index+')').attr('checked', false);
	    }
	       	              
	}); 
	
    //index 페이지 pop_up 좌석 인원 채크 플러스 버튼 작업
    $(".bookingSelectSeatTicket .plus").click(function(e){
        e.preventDefault();
        
        var price = Number($(this).parent().find("label:eq(0)").attr("data"));
        var cnt = Number($(this).parent().find(".reserveCnt").html());
        var num1 = $('.reserveCnt').eq(0).text();
    	var num2 = $('.reserveCnt').eq(1).text();
    	var result = parseInt(num1) + parseInt(num2);
    	var check = $('input:checkbox[name=seat]').length; // 체크박스의 개수
    	
        if(cnt == check) {
        	alert('10좌석을 초과할 수 없습니다.')
            return;
        } else if(result == check){
        	alert('10좌석을 초과할 수 없습니다.')
        	return;
        }
        cnt = cnt + 1; 
        
        $(this).parent().find(".reserveCnt").html(cnt);
        var total = Number(uncomma($("#ticketTotalPrice span").html()));
        $("#ticketTotalPrice span").html(comma(total + price));
    })
    
    //index 페이지 pop_up 좌석 인원 채크 마이너스 버튼 작업
    $(".bookingSelectSeatTicket .minus").click(function(e){
        e.preventDefault();
        
        var price = Number($(this).parent().find("label:eq(0)").attr("data"));
        var cnt = Number($(this).parent().find(".reserveCnt").html());

        
        if(cnt == 0) {
            return;
        }
        cnt = cnt - 1;

        $(this).parent().find(".reserveCnt").html(cnt);
        var total = Number(uncomma($("#ticketTotalPrice span").html()));
        $("#ticketTotalPrice span").html(comma(total - price));
        
    	var result = parseInt($('.reserveCnt').eq(0).text()) + parseInt($('.reserveCnt').eq(1).text());
        var check = document.getElementsByName("seat");
		var len = check.length
		var checkCnt = $('input:checkbox[name=seat]:checked').length; // 체크된 체크박스의 개수
        
        if(checkCnt > result){ 
        	if(confirm('선택한 좌석을 취소하시겠습니까?')) {
        		for (var i = 0; i < len; i++) {
                	if (check[i].checked == true) {
                		$('img[alt=spaceSeat]:eq('+i+')').attr('src', './main/img/seat/off.svg');
                	    $('.checkbox:eq('+i+')').attr('checked', false);
                	}
                	$('.reserveCnt').eq(0).text(0);
                    $('.reserveCnt').eq(1).text(0);
                    $("#ticketTotalPrice span").text(0)
        		}       	
        	} else {
        		cnt = cnt + 1;
        		$(this).parent().find(".reserveCnt").html(cnt);
        	}       	
        }
    });	