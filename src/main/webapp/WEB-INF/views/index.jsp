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
<spring:url value="/respostas/salva" var="salva"></spring:url>

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
	
	#card {
		border-style: solid;
		border-color: #4F4F4F;
	}
		
	#card-header {
		background-image: linear-gradient(to right, #232323, #232323, #4F4F4F);
	}
	
	#card-body {
		background-image: linear-gradient(to left, #232323, #232323, #4F4F4F);
	}
	
</style>

<script type="text/javascript">
	
	function ynCheck(elm, div, radio) {
		if(radio != 'SIM'){
			document.getElementById(div).style.display = "none";
			/*document.getElementById(div).querySelectorAll("input").setAttribute("required", "");  
			/*document.getElementById(div).style.visibility = "hidden";*/
		} else {
			document.getElementById(div).style.display = "inline-block";
			document.getElementById(div).style.width = "86%";
			/*document.getElementById(div).querySelectorAll("input").setAttribute("required", "false");
			/*document.getElementById(div).style.visibility = "visible";*/
		}
	}

	function enableCheckBox(div, chBox){
		if(chBox.checked) {
			document.getElementById(div).style.display = "inline-block";
		} else {
			document.getElementById(div).style.display = "none";
		}
	}
	
</script>
	
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
		<form:form action="${salva}" modelAttribute="respostaWrapper" method="POST">

			<c:forEach items="${listaQuestoes}" var="questao" varStatus="i">
				<form:hidden path="listaResposta[${i.index}].colaborador"         value="1"/> <!-- id 1 temporario-->
				<form:hidden path="listaResposta[${i.index}].questao"             value="${questao.id}"/>
				<form:hidden path="listaComplementoResposta[${i.index}].resposta" value="${questao.id}"/> <!-- gerando lista complemento do mesmo tamanho da de questao -->
				<div class="form-group">
					<div class="card text-white" id="card">
						<div class="card-header" id="card-header">
							${questao.descricao}
						</div>
						<div class="card-body" id="card-body">
							<c:choose>
								
								<c:when test="${questao.tipoEntradaQuestao.descricao == 'TEXTO'}">
									<form:input path="listaResposta[${i.index}].descricao" type="text" class="form-control" placeholder="Questao ${questao.id}" id="questao${questao.id}" maxlength="200" style="width: 100%;" required="true"/>
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
											
											<c:choose>
												<c:when test="${opcao.descricao == 'NAO' }">
													<form:radiobutton path="listaResposta[${i.index}].descricao" value="${opcao.descricao}" id="${opcao.id}"  onclick="ynCheck(this, 'complemento${questao.id}', '${opcao.descricao}')"/>${opcao.descricao}
												</c:when>
												<c:when test="${opcao.descricao == 'SIM' }">
													<form:radiobutton path="listaResposta[${i.index}].descricao" value="${opcao.descricao}" id="${opcao.id}" onclick="ynCheck(this, 'complemento${questao.id}', '${opcao.descricao}')"/>${opcao.descricao}	
													<div id="complemento${questao.id}" class="text" style="display: none;">
		   												<form:input path="listaComplementoResposta[${i.index}].descricao" type="text" class="form-control" placeholder="Justifique ou descreva qual(is)" id="complementoResposta" maxlength="100"/>
		   											</div>
												</c:when>
											</c:choose>
											
										</c:if>
									</c:forEach>
								</c:when>
								
								<c:when test="${questao.tipoEntradaQuestao.descricao == 'MULTICHECKBOX'}">
									<c:forEach items="${listaOpcoesQuestao}" var="opcao">
										<c:if test="${questao.id == opcao.questao.id}">
											<div class="custom-control custom-checkbox mb-3">
												<input type="checkbox" value="${opcao.descricao}" class="custom-control-input" id="customCheck${opcao.id}" name="listaResposta[${i.index}].descricao" onclick="enableCheckBox('complementoResposta${opcao.id}',this)">
										      	<label class="custom-control-label" for="customCheck${opcao.id}">${opcao.descricao}</label>
										      	<input name="listaComplementoResposta[${i.index}].descricao" type="text" id="complementoResposta${opcao.id}" placeholder="Qual(is)?" style="display: none;" maxlength="100">
										    </div>
										</c:if>
									</c:forEach>
									
								</c:when>
								
								<c:when test="${questao.tipoEntradaQuestao.descricao == 'FILHO' }">
								
									<c:forEach items="${listaOpcoesQuestao}" var="opcao">
										<c:if test="${questao.id == opcao.questao.id}">
												
											<c:if test="${opcao.descricao == 'NAO' }">
												<form:radiobutton path="listaResposta[${i.index}].descricao" id="${opcao.id}" value="${opcao.descricao}" onclick="ynCheck(this, 'complemento${questao.id}', '${opcao.descricao}')"/>${opcao.descricao}
											</c:if>
											<c:if test="${opcao.descricao == 'SIM' }">
												<form:radiobutton path="listaResposta[${i.index}].descricao" id="${opcao.id}" value="${opcao.descricao}" onclick="ynCheck(this, 'complemento${questao.id}', '${opcao.descricao}')"/>${opcao.descricao}
													<div id="complemento${questao.id}" class="text" style="display: none;">
														<input name="listaResposta[${i.index}].descricao" type="text" class="text" placeholder="Quantos?" id="qtdeFilho">
														<input name="listaComplementoResposta[${i.index}].descricao" type="text" class="text" placeholder="Idade(s)" >
													</div>
											</c:if>	
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
	</footer>	
</body>
</html>
