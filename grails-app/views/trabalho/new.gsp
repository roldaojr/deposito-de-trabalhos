<div ng-controller="EditTrabalhoCtrl">
	<form class="form-horizontal">
		<h1 class="page-header"><g:message code="myapp.AddWork"></msg></h1>
		<fieldset>
			<div class="control-group">
				<label class="control-label" for="titulo"><g:message code="myapp.Title"/></label>
				<div class="controls">
					<input id="titulo" type="text" class="input-block-level"
						required="true" ng-model="trabalho.titulo"></input>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="assunto"><g:message code="myapp.Subject"/></label>
				<div class="controls">
					<input id="assunto" type="text" class="input-block-level"
						required="true" ng-model="trabalho.assunto"></input>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="categoria"><g:message code="myapp.Category"/></label>
				<div class="controls">
					<select ng-model="trabalho.categoria.id" ng-options="o.id as o.nome for o in categorias" class="input-block-level">
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="orientador"><g:message code="myapp.Leader"></label>
				<div class="controls">
				<!-- ng-options="o.id as o.nome for o in orientadores" -->
					<input id="orientador" ui-select2="orientadoresOptions" ng-model="trabalho.orientador" class="input-block-level" />
					<a title="Adicionar orientador" ng-click="adicionarOrientador()" class="btn"><i class="icon-plus"></i> <g:message code="myapp.Add Leader"></a>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="resumo"><g:message code="myapp.Abstract"/></label>
				<div class="controls">
					<textarea id="resumo" class="input-block-level"
						required="true" ng-model="trabalho.resumo"></textarea>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="resumo"><g:message code="myapp.Authors"></msg></label>
				<div class="controls">
					<input id="autores" ui-select2="autoresOptions" ng-model="trabalho.autores" data-placeholder="Selecionar autores..." class="input-block-level"/>
					<a title="Adicionar autor" ng-click="adicionarAutor()" class="btn"><i class="icon-plus"></i><g:message code="myapp.Add Author"></msg></a>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="palavrasChave"><g:message code="myapp.Keywords"></msg></label>
				<div class="controls">
					<input id="palavrasChave" ui-select2="palavrasChaveOptions" ng-model="trabalho.termos_chave" data-placeholder="Selecionar palavras chave..." class="input-block-level"/>
				</div>
			</div>
		</fieldset>
		<div class="form-actions">
			<button ng-click="saveTrabalho()" class="btn btn-primary">Salvar</button>
		</div>
	</form>
</div>