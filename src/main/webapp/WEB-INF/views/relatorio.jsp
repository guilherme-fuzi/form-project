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

<link href="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.css" rel="stylesheet">
<script src="https://unpkg.com/tableexport.jquery.plugin/tableExport.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table-locale-all.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/extensions/export/bootstrap-table-export.min.js"></script>

<c:import url="files.jsp"/>

<style type="text/css">
	body {
		background-color: #232323;
	}
</style>

<style>
	.like {
	   margin-right: 10px;
	}
</style>

</head>
<body>
	<h1 style="color: white; text-align: center;">DADOS</h1>
	<br>
	<div class="container-fluid">
		<table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width:100%; color: white;">
			<thead>
				<tr>
					<th>QUESTÃO</th>
					<th>RESPOSTA</th>
					<th>DATA DE ENVIO</th>
					<th>ID FUNCIONARIO</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dadosBanco}" var="data">
					<tr>
						<th>${data.questao}</th>
						<th>${data.resposta}</th>
						<th>${data.data_envio}</th>
						<th>${data.id_colab}</th>
					</tr>
				</c:forEach>	 
				
			</tbody>
			<tfoot>
				<tr>
					<th>QUESTÃO</th>
					<th>RESPOSTA</th>
					<th>DATA DE ENVIO</th>
					<th>ID FUNCIONARIO</th>
				</tr>
			</tfoot>
		</table>
	</div>
	
</body>
</html>









