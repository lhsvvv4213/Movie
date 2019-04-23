$(document).ready(function(){

	$(document).on('click', function(e) {
	    if (!$(e.target).hasClass("icon_right")) {
	    	$('tr').find('.admin_authority_inner').removeClass('active'); 
	    	 console.log('____3');
	    }
	    console.log('____4');
	});

	$('.icon_right').click(function(e){
		$(this).children().toggleClass('active');
		if($('.icon_right .admin_authority_inner div').hasClass('admin_authority')){
			$(this).closest('tr').siblings().find('.admin_authority_inner').removeClass('active');
		}
	});
	
	 $(".date").datepicker({
	        dateFormat: "yy-mm-dd"
	 }).datepicker("setDate", "0");
	 
	 $(".updateBtn").click(function() {
       	var checkBtn = $(this);
       	var tr = checkBtn.closest('tr');
        var td = tr.children();
        var id = td.eq(1).text();
        var url = "admin_MemberChange.movie"
           
    	memberId_submit(id, url)
      })
       
     $(".deleteBtn").click(function() {
       	var checkBtn = $(this);
        var tr = checkBtn.closest('tr');
        var td = tr.children();
        var id = td.eq(1).text();
    	var url = "admin_MemberDelete.movie"
           
    	memberId_submit(id, url)
      })
      
      $("#cinema").change(function() {
    	  var cinema = $("#cinema option:selected").text()
          cinema = cinema.replace(/\s/gi,'%20')
                  
          $("#screen").load('screenList.movie?screencode=' + cinema) 
      })
         
});

function memberId_submit(id, url) {
	
    var form = document.createElement("form");

    form.setAttribute("charset", "UTF-8");
    form.setAttribute("method", "Post");
    form.setAttribute("action", url);

    var hiddenField = document.createElement("input");

    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "id");
    hiddenField.setAttribute("value", id)

    form.appendChild(hiddenField);

    document.body.appendChild(form);

    form.submit();
}

function change() {
	$('#adminChange').submit()
}

function deleteMember() {
	$('#memberDelete').submit()
}

function deleteMovie() {
	$('#movieDelete').submit()
}
