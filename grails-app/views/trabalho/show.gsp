
<%@ page import="trabalhos.Trabalho" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'trabalho.label', default: 'Trabalho')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-trabalho" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-trabalho" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list trabalho">
			
				<g:if test="${trabalhoInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="trabalho.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${trabalhoInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trabalhoInstance?.aprovado}">
				<li class="fieldcontain">
					<span id="aprovado-label" class="property-label"><g:message code="trabalho.aprovado.label" default="Aprovado" /></span>
					
						<span class="property-value" aria-labelledby="aprovado-label"><g:formatBoolean boolean="${trabalhoInstance?.aprovado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${trabalhoInstance?.assunto}">
				<li class="fieldcontain">
					<span id="assunto-label" class="property-label"><g:message code="trabalho.assunto.label" default="Assunto" /></span>
					
						<span class="property-value" aria-labelledby="assunto-label"><g:fieldValue bean="${trabalhoInstance}" field="assunto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trabalhoInstance?.autores}">
				<li class="fieldcontain">
					<span id="autores-label" class="property-label"><g:message code="trabalho.autores.label" default="Autores" /></span>
					
						<g:each in="${trabalhoInstance.autores}" var="a">
						<span class="property-value" aria-labelledby="autores-label"><g:link controller="trabalhoAutor" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${trabalhoInstance?.categorias}">
				<li class="fieldcontain">
					<span id="categorias-label" class="property-label"><g:message code="trabalho.categorias.label" default="Categorias" /></span>
					
						<g:each in="${trabalhoInstance.categorias}" var="c">
						<span class="property-value" aria-labelledby="categorias-label"><g:link controller="trabalhoCategoria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${trabalhoInstance?.enviado}">
				<li class="fieldcontain">
					<span id="enviado-label" class="property-label"><g:message code="trabalho.enviado.label" default="Enviado" /></span>
					
						<span class="property-value" aria-labelledby="enviado-label"><g:formatDate date="${trabalhoInstance?.enviado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${trabalhoInstance?.orientador}">
				<li class="fieldcontain">
					<span id="orientador-label" class="property-label"><g:message code="trabalho.orientador.label" default="Orientador" /></span>
					
						<span class="property-value" aria-labelledby="orientador-label"><g:link controller="orientador" action="show" id="${trabalhoInstance?.orientador?.id}">${trabalhoInstance?.orientador?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${trabalhoInstance?.publicado}">
				<li class="fieldcontain">
					<span id="publicado-label" class="property-label"><g:message code="trabalho.publicado.label" default="Publicado" /></span>
					
						<span class="property-value" aria-labelledby="publicado-label"><g:formatDate date="${trabalhoInstance?.publicado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${trabalhoInstance?.resumo}">
				<li class="fieldcontain">
					<span id="resumo-label" class="property-label"><g:message code="trabalho.resumo.label" default="Resumo" /></span>
					
						<span class="property-value" aria-labelledby="resumo-label"><g:fieldValue bean="${trabalhoInstance}" field="resumo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trabalhoInstance?.termos_chave}">
				<li class="fieldcontain">
					<span id="termos_chave-label" class="property-label"><g:message code="trabalho.termos_chave.label" default="Termoschave" /></span>
					
						<g:each in="${trabalhoInstance.termos_chave}" var="t">
						<span class="property-value" aria-labelledby="termos_chave-label"><g:link controller="trabalhoTermoChave" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:trabalhoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${trabalhoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
