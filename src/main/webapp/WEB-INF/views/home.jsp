<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qintess - Innovation Obsessed</title>
<c:import url="files.jsp"/>

<style type="text/css">

	
	h2 {
	  color: gray;
	  text-shadow: 2px 2px 4px #000000;
	}

	body {
		background-color: #232323;
	}
	
	.content {
		margin-left: 25%;
		margin-top: 2%;
		width: 50%;
		position: relative;
		text-align: center;
	}

	#img-logo {
		width: 100%;
		heigth: 100%;
		-webkit-animation: rotation 5s infinite linear;
	}

	img.center {
		margin: auto;
		display: block;
		position: relative;
	}
	
	@-webkit-keyframes rotation {
		from {
				-webkit-transform: rotate(0deg);
		}
		to {
				-webkit-transform: rotate(359deg);
		}
	}

</style>

<script type="text/javascript">

</script>

</head>

<body>
	<div class="content">
		<h2>Selecione seu perfil abaixo: </h2>
		<div class="container" style="width: 50%;">
			<button onClick="window.location='/formulario-qintess/operacional';" class="btn btn-dark">Operacional</button>
			<button onClick="window.location='/formulario-qintess/tecnico';" class="btn btn-dark">Técnico</button>			
		</div>
		<hr>
	</div>
	
	<div class="container" style="width: 30%;">
		<img id="img-logo" class="center" src="images/symbol.png" alt="logo" >	
	</div>

</body>
</html>


