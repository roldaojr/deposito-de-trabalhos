<div ng-controller="EditOrientadorCtrl">
	<form class="form-horizontal">
		<h1 class="page-header"><g:message code="myapp.EditLeader"/> ({{orientador.nome}})</h1>
		<fieldset>
			<div class="control-group">
				<label class="control-label" for="nome"><g:message code="myapp.Name"/></label>
				<div class="controls">
					<input id="nome" type="text" class="input-block-level"
						required="true" ng-model="orientador.nome"></input>
				</div>
			</div>
		</fieldset>
		<div class="form-actions">
			<button ng-click="updateOrientador()" class="btn btn-primary"><g:message code="myapp.Save"/></button>
		</div>
	</form>
</div>