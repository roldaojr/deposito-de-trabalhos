<%@ page import="trabalhos.Trabalho" %>



<div class="fieldcontain ${hasErrors(bean: trabalhoInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="trabalho.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${trabalhoInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trabalhoInstance, field: 'aprovado', 'error')} ">
	<label for="aprovado">
		<g:message code="trabalho.aprovado.label" default="Aprovado" />
		
	</label>
	<g:checkBox name="aprovado" value="${trabalhoInstance?.aprovado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: trabalhoInstance, field: 'assunto', 'error')} ">
	<label for="assunto">
		<g:message code="trabalho.assunto.label" default="Assunto" />
		
	</label>
	<g:textField name="assunto" value="${trabalhoInstance?.assunto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trabalhoInstance, field: 'autores', 'error')} ">
	<label for="autores">
		<g:message code="trabalho.autores.label" default="Autores" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${trabalhoInstance?.autores?}" var="a">
    <li><g:link controller="trabalhoAutor" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="trabalhoAutor" action="create" params="['trabalho.id': trabalhoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'trabalhoAutor.label', default: 'TrabalhoAutor')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: trabalhoInstance, field: 'categorias', 'error')} ">
	<label for="categorias">
		<g:message code="trabalho.categorias.label" default="Categorias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${trabalhoInstance?.categorias?}" var="c">
    <li><g:link controller="trabalhoCategoria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="trabalhoCategoria" action="create" params="['trabalho.id': trabalhoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'trabalhoCategoria.label', default: 'TrabalhoCategoria')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: trabalhoInstance, field: 'enviado', 'error')} required">
	<label for="enviado">
		<g:message code="trabalho.enviado.label" default="Enviado" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="enviado" precision="day"  value="${trabalhoInstance?.enviado}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: trabalhoInstance, field: 'orientador', 'error')} required">
	<label for="orientador">
		<g:message code="trabalho.orientador.label" default="Orientador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="orientador" name="orientador.id" from="${trabalhos.Orientador.list()}" optionKey="id" required="" value="${trabalhoInstance?.orientador?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trabalhoInstance, field: 'publicado', 'error')} required">
	<label for="publicado">
		<g:message code="trabalho.publicado.label" default="Publicado" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="publicado" precision="day"  value="${trabalhoInstance?.publicado}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: trabalhoInstance, field: 'resumo', 'error')} ">
	<label for="resumo">
		<g:message code="trabalho.resumo.label" default="Resumo" />
		
	</label>
	<g:textField name="resumo" value="${trabalhoInstance?.resumo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: trabalhoInstance, field: 'termosChave', 'error')} ">
	<label for="termosChave">
		<g:message code="trabalho.termosChave.label" default="Termoschave" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${trabalhoInstance?.termosChave?}" var="t">
    <li><g:link controller="trabalhoTermoChave" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="trabalhoTermoChave" action="create" params="['trabalho.id': trabalhoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'trabalhoTermoChave.label', default: 'TrabalhoTermoChave')])}</g:link>
</li>
</ul>

</div>

