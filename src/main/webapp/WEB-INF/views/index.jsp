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
<link rel="stylesheet" type="text/css" href='<spring:url value="css/modify.css"/>'>
<script type="text/javascript" src="js/functions.js"></script>

<spring:url value="/respostas/salva" var="salva"></spring:url>
	
</head>
<body>
	<header style="background-image: url('images/motion_marca2.gif');">
		<div class="container-fluid">
				<h3 align="left" style="color: white;">Bem vindo, {{ colaborador.nome }}</h3>
				<p class="lead"  style="color: white;">Por favor, preencha o formulário</p>
		</div>
	</header>
	<div class="container">
		<form:form action="${salva}" modelAttribute="respostaWrapper" method="POST">
			<c:forEach items="${listaQuestoes}" var="questao" varStatus="i">
				<form:hidden path="listaResposta[${i.index}].colaborador"         value="1"/> <!-- id 1 temporario-->
				<form:hidden path="listaResposta[${i.index}].questao"             value="${questao.id}"/>
				<form:hidden path="listaComplementoResposta[${i.index}].resposta" value="${questao.id}"/>
				<div class="form-group">
					<div class="card text-white" id="card">
						<div class="card-header" id="card-header">
							${questao.descricao}
						</div>
						<div class="card-body" id="card-body">
							<c:choose>
								<c:when test="${questao.tipoEntradaQuestao.descricao == 'TEXTO'}">
									<form:input path="listaResposta[${i.index}].descricao" type="text" class="form-control" placeholder="Questao ${questao.id}" id="questao${questao.id}" maxlength="200" style="width: 100%; background-color: #252525; color: white;" required="true"/>
								</c:when>
								<c:when test="${questao.tipoEntradaQuestao.descricao == 'DROPDOWN'}">
									<select name="selectOption" class="selectpicker">
										<option selected style="background-color: #252525; color: white;">Escolha</option>
										<c:forEach items="${listaOpcoesQuestao}" var="opcao">
											<c:if test="${questao.id == opcao.questao.id}">
												<option value="${opcao.descricao}" style="background-color: #252525; color: white;">${opcao.descricao}</option>
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
		   												<form:input path="listaComplementoResposta[${i.index}].descricao" class="form-control" placeholder="Justifique ou descreva qual(is)" id="complementoResposta${opcao.id}" maxlength="100" disabled="disabled" required="required"/>
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
										      	<input name="listaComplementoResposta[${i.index}].descricao" id="complementoResposta${opcao.id}" placeholder="Qual(is)?" style="display: none; width: 350px;" maxlength="100" disabled="disabled">
										    </div>
										</c:if>
									</c:forEach>
								</c:when>
								<c:when test="${questao.tipoEntradaQuestao.descricao == 'FILHO' }">
									<c:forEach items="${listaOpcoesQuestao}" var="opcao">
										<c:if test="${questao.id == opcao.questao.id}">
											<c:if test="${opcao.descricao == 'NAO' }">
												<form:radiobutton path="listaResposta[${i.index}].descricao" id="${opcao.id}" value="${opcao.descricao}" onclick="ynCheck2(this, 'complemento${questao.id}', qtdeFilho, idadeFilho, '${opcao.descricao}')"/>${opcao.descricao}
											</c:if>
											<c:if test="${opcao.descricao == 'SIM' }">
												<form:radiobutton path="listaResposta[${i.index}].descricao" id="${opcao.id}" value="${opcao.descricao}" onclick="ynCheck2(this, 'complemento${questao.id}', qtdeFilho, idadeFilho, '${opcao.descricao}')"/>${opcao.descricao}
													<div id="complemento${questao.id}" style="display: none;">
														<input name="listaResposta[${i.index}].descricao" type="number" min="1" placeholder="Quantos?" id="qtdeFilho" style="width: 25%; text-align: center;" disabled="disabled">
														<input name="listaComplementoResposta[${i.index}].descricao" class="text" placeholder="Idade(s)" id="idadeFilho" disabled="disabled">
													</div>
											</c:if>	
										</c:if>
									</c:forEach>
								</c:when>
								<c:when test="${questao.tipoEntradaQuestao.descricao == 'DROPDOWN-MULTIPLE' }">
									<select name="listaResposta[${i.index}].descricao" class="selectpicker btn-group dropright" multiple>
										<c:forEach items="${listaOpcoesQuestao}" var="opcao">
											<c:if test="${questao.id == opcao.questao.id}">
												<option value="${opcao.descricao}" style="background-color: #252525; color: white;">${opcao.descricao}</option>
											</c:if>
										</c:forEach>
									</select>
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
	<footer id="footer" style="background-image: url('images/symbol.png');">
	</footer>	
</body>
</html>
