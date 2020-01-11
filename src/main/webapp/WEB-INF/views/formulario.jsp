<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulário - Qintess</title>
<c:import url="index.jsp"/>
</head>
<body>
	<div class="container">
		<form>
			<!-- Utilizar um for para carregar todas as perguntas do banco -->
			<div class="form-group">
				<div class="card">
					<div class="card-header">
						Tecnologia principal ou Atividades que executa
					</div>
					<div class="card-body">
						opcoes de resposta/dropdowns
					</div>
				</div>
			</div>
		
			<button type="button" class="btn btn-outline-success btn-block">SUBMIT</button>
		</form>	
	</div>
</body>
</html>