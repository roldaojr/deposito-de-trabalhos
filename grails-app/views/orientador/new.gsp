<div ng-controller="NewOrientadorCtrl">
	<form class="form-horizontal">
		<h1 class="page-header"><g:message code="myapp.AddLeader"/></h1>
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
			<button class="btn btn-primary" ng-click="saveOrientador()"><g:message code="myapp.AddLeader"/></button>
		</div>
	</form>
</div>