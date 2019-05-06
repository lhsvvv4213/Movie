<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var table = $('#table_id').DataTable({
			"aaSorting" : [ [ 0, 'desc' ] ], //desc: 내림차순, asc: 올림차순
			autoWidth : false,
			"columns" : [ {"width" : "100px", "targets" : 0}, 
						  {"width" : "900px", "targets" : 1}, 
						  {"width" : "150px", "targets" : 2} ]
		});

		$('#table_id tbody').on('click', 'tr', function() {
			// DataTable 인덱스 식별자 구함
			var data = table.row(this).data();

			location.href = 'notice_Detail.movie?noticecode=' + data[0];
		});
	});
</script>