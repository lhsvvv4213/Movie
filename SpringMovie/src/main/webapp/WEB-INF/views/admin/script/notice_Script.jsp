<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    $(document).ready(function() {
        
        $('#dataTable').DataTable({
        	autoWidth: false,
        	"columns": [
            	{ "width": "150px", "targets": 0},
            	{ "width": "900px", "targets": 1}
         	]
        });  
    });
</script>