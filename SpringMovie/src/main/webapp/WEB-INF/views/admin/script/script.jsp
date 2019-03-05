<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
    $(document).ready(function() {

    	$('#dataTable').DataTable({
    		"aaSorting": [[5, 'asc']],
        	autoWidth: false,
        	"columns": [
            	{ "width": "100px", "targets": 0},
            	{ "width": "120px", "targets": 1},
            	{ "width": "320px", "targets": 2},
            	{ "width": "150px", "targets": 3},
            	{ "width": "80px", "targets": 4},
            	{ "width": "80px", "targets": 5}
         	]
        });        
    });
</script>