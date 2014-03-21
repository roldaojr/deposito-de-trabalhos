<div ng-controller="NewAutorCtrl">
	<form class="form-horizontal">
		<h1 class="page-header"><g:message code="myapp.AddAuthor"/></h1>
		<fieldset>
			<div class="control-group">
				<label class="control-label" for="nome"><g:message code="myapp.Name"/></label>
				<div class="controls">
					<input id="nome" type="text" class="input-block-level"
						required="true" ng-model="autor.nome"></input>
				</div>
			</div>
		</fieldset>
		<div class="form-actions">
			<button class="btn btn-primary" ng-click="saveAutor()"><g:message code="myapp.AddAuthor"/></button>
		</div>
	</form>
</div>