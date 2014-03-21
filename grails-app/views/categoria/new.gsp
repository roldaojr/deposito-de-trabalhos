<div ng-controller="NewCategoriaCtrl">
	<form class="form-horizontal">
		<h1 class="page-header"><g:message code="myapp.AddCategory"/></h1>
		<fieldset>
			<div class="control-group">
				<label class="control-label" for="nome"><g:message code="myapp.Name"/></label>
				<div class="controls">
					<input id="nome" type="text" class="input-block-level"
						required="true" ng-model="categoria.nome"></input>
				</div>
			</div>
		</fieldset>
		<div class="form-actions">
			<button class="btn btn-primary" ng-click="saveCategoria()"><g:message code="myapp.AddCategory"/></button>
		</div>
	</form>
</div>