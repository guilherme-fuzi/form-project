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
<c:import url="files.jsp"/>

<spring:url value="/formulario/salva" var="salva"></spring:url>
	
</head>
	
<body>
	<header id="header">
		<div class="container-fluid">
			<!-- <div class="jumbotron mt-3 mb-3"> -->
				<h3 align="left" style="color: white;">Bem vindo, {{ colaborador.nome }}</h3>
				<p class="lead"  style="color: white;">Por favor, preencha o formulário</p>
			
		</div>
	</header>
	
	<div class="container">
		<form:form action="${salva}" modelAttribute="formulario">
			<c:forEach items="${listaQuestoes}" var="questao">
				<div class="form-group">
					<div class="card">
						<div class="card-header">
							${questao.descricao}
						</div>
						<div class="card-body">
							<c:choose>
							
								<c:when test="${questao.tipoEntradaQuestao.descricao == 'TEXTO'}">
									<input type="text" class="form-control" placeholder="Questao ${questao.id}" id="questao${questao.id}">
								</c:when>
								
								<c:when test="${questao.tipoEntradaQuestao.descricao == 'DROPDOWN'}">
									<select name="selectOption" class="selectpicker">
										<option selected>Escolha</option>
										<c:forEach items="${listaOpcoesQuestao}" var="opcao">
											<c:if test="${questao.id == opcao.questao.id}">
												<option value="${opcao.descricao}">${opcao.descricao}</option>
											</c:if>
										</c:forEach> 
									</select>
								</c:when>
								
								<c:when test="${questao.tipoEntradaQuestao.descricao == 'CHECKBOX'}">
									<c:forEach items="${listaOpcoesQuestao}" var="opcao">
										<c:if test="${questao.id == opcao.questao.id}">
											<div class="custom-control custom-radio custom-control-inline"> 
												<input type="radio" class="custom-control-input" id="radioOpcao${opcao.id}" name="questao${questao.id}" value="${opcao.descricao}" onclick="mostrar('complemento${questao.id}')" checked>
	   											<label class="custom-control-label" for="radioOpcao${opcao.id}">${opcao.descricao}</label>
	   											<c:if test="${opcao.descricao == 'SIM'}">
		   											<div id="complemento${questao.id}" class="text">
		   												<input type="text" id="complementoResposta${questao.id}" placeholder="QUAL(IS)?">
		   											</div>
   												</c:if>
											</div>
										</c:if>
									</c:forEach>
								</c:when>
								
								<c:when test="${questao.tipoEntradaQuestao.descricao == 'MULTICHECKBOX'}">
									<c:forEach items="${listaOpcoesQuestao}" var="opcao">
										<c:if test="${questao.id == opcao.questao.id}">
											<div class="custom-control custom-checkbox mb-3">
												<input type="checkbox" class="custom-control-input" id="customCheck${opcao.id}" name="questao${questao.id}">
										      	<label class="custom-control-label" for="customCheck${opcao.id}">${opcao.descricao}</label>
										      	<input type="text" id="complementoResposta${questao.id}" placeholder="QUAL(IS)?" disabled>
										    </div>
										</c:if>
									</c:forEach>
								</c:when>
								
							</c:choose>
						</div>
					</div>
				</div>				
			</c:forEach>
			
			<button type="submit" class="btn btn-outline-dark btn-lg btn-block">SUBMIT</button>
		</form:form>	
	</div>
	<br>
	<footer id="footer">
	<!-- 
			<h4 style="color: white;">Innovation Obsessed</h4>
 	-->
	</footer>
	
</body>
</html>

<!-- JS -->
<script type="text/javascript">
	
	$(document).ready(function () {
		//$(".text").hide();
	});
	
	
	
	function mostrar(el) {
		var display = document.getElementById(el).style.display;
		
		if(display == "none") {
			document.getElementById(el).style.display = 'block';	
	    }
	    else {
	    	document.getElementById(el).style.display = 'none';
	    }
	}
	
	
	
</script>

<!-- CSS -->

<style type="text/css">

	header {
	  width: 60%;
	  background-color: #232323;
	  text-align: left;
	  padding: 15px;
	  margin-right: 120px;
  	  margin-left: 120px;
  	  margin-bottom: 15px;
  	  background-image: url("images/motion_marca2.gif");
  	  background-repeat: no-repeat;
  	  background-position: right;
	} 	

	body {
		color: black;
		background-image: linear-gradient(#232323, #232323, #6A26DF, #9F358F, #D44540); 
		background-size: auto;
		background-repeat: repeat;
		background-color: #232323;
		
		
		background-size: 60%;
	}

	footer {
		height: 85px;
		background-color: #232323;
		background-image: url("images/symbol.png");
		background-repeat: no-repeat;
		background-position: center;
		background-size: 4%; 
	}
	
	.container {
	    width: 60%;
	    padding-right: 8px;
	    padding-left: 8px;
	    margin-right: auto;
	    margin-left: 120px;
	    max-width: 80%;
	}
	
</style>
 	

