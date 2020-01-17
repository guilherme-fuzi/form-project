<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Relatório</title>

<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.bootstrap4.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap4.min.css">

<style type="text/css">
	body {
		background-color: gray;
	}
	
	.container {
		width: 50%;
	}
	
	thead {
		text-align: center;
	}
</style>

<style>
	.like {
	   margin-right: 10px;
	}
</style>

</head>
<body>
	<h1 style="color: white; text-align: center;">Dados</h1>
	<br>
	
	<div class="container">
		<table id="table1" style="width:100%; color: white;" class="table table-striped table-bordered dt-responsive nowrap">
			<thead>
				<tr>
					<th>ID</th>
					<th>RESPOSTA</th>
					<th>DATA DE ENVIO</th>
					<th>ID QUESTAO</th>
					<th>ID FUNCIONARIO</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dadosResposta}" var="data">
					<tr>
						<th align="center">${data.id}</th>
						<th>${data.descricao}</th>
						<th align="center">${data.data_envio}</th>
						<th align="center">${data.questao.id}</th>
						<th align="center">${data.colaborador.id}</th>
					</tr>
				</c:forEach>	 
				
			</tbody>
		</table>
		
		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap4.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
	    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
	    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
	    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
	    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
	    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
	    <script>
		$(document).ready(function() {
		    var table = $('#table1').DataTable( {
		        lengthChange: false,
		        buttons: [ 'copy', 'excel', 'csv', 'pdf', 'colvis' ]
		    } );
		 
		    table.buttons().container()
		        .appendTo( '#table1_wrapper .col-md-6:eq(0)' );
		} );
	     </script>
		
	</div>
	
</body>
</html>









