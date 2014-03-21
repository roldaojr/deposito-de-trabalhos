<div ng-controller="EditUsuarioCtrl">
	<form class="form-horizontal">
		<h1 class="page-header"><g:message code="myapp.EditUser"/> ({{usuario.username}})</h1>
		<fieldset>
			<div class="control-group">
				<label class="control-label" for="nome"><g:message code="myapp.Username"/></label>
				<div class="controls">
					<input id="nome" type="text" class="input-block-level"
						required="true" ng-model="usuario.username"></input>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="nome"><g:message code="myapp.Password"/></label>
				<div class="controls">
					<input id="nome" type="password" class="input-block-level"
						required="true" ng-model="usuario.password"></input>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="nome"><g:message code="myapp.UserOptions"/></label>
				<div class="controls">
					<label class="checkbox" class="input-block-level" >
						<input type="checkbox" ng-model="usuario.enabled"/> <g:message code="myapp.Enabled"/>
					</label>
					<label class="checkbox" class="input-block-level" >
						<input type="checkbox" ng-model="usuario.accountExpired"/> <g:message code="myapp.AccountExpired"/>
					</label>
					<label class="checkbox" class="input-block-level" >
						<input type="checkbox" ng-model="usuario.accountLocked"/> <g:message code="myapp.AccountLocked"/>
					</label>
					<label class="checkbox" class="input-block-level" >
						<input type="checkbox" ng-model="usuario.passwordExpired"/> <g:message code="myapp.PasswordExpired"/>
					</label>
				</div>
			</div>

		</fieldset>
		<div class="form-actions">
			<button ng-click="updateUsuario()" class="btn btn-primary"><g:message code="myapp.Save"/></button>
		</div>
	</form>
</div>