<%@ page import="trabalhos.Orientador" %>



<div class="fieldcontain ${hasErrors(bean: orientadorInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="orientador.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${orientadorInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: orientadorInstance, field: 'trabalhos', 'error')} ">
	<label for="trabalhos">
		<g:message code="orientador.trabalhos.label" default="Trabalhos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${orientadorInstance?.trabalhos?}" var="t">
    <li><g:link controller="trabalho" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="trabalho" action="create" params="['orientador.id': orientadorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'trabalho.label', default: 'Trabalho')])}</g:link>
</li>
</ul>

</div>

