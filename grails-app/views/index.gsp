<!doctype html>
<html lang="en" ng-app="myApp">
<head>
<meta charset="utf-8">
<title><g:message code="myapp.apptitle" /></title>
<link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="lib/select2/select2.css">
<link rel="stylesheet" href="lib/growl/growl.css" />
<link rel="stylesheet" href="css/app.css" />
</head>
<body ng-controller="AppCtrl">
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="#"><g:message code="myapp.apptitle" /></a>
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li ng-class="activeWhen(path() == '/categorias')"><a href="#/categorias"><g:message code="myapp.Categories"/></a></li>
						<li ng-class="activeWhen(path() == '/orientadores')"><a href="#/orientadores"><g:message code="myapp.Leaders"/></a></li>
						<li ng-class="activeWhen(path() == '/autores')"><a href="#/autores"><g:message code="myapp.Authors"/></a></li>
						<li ng-class="activeWhen(path() == '/trabalhos')"><a href="#/trabalhos"><g:message code="myapp.Works"/></a>
						<li ng-class="activeWhen(path() == '/usuarios')"><a href="#/usuarios"><g:message code="myapp.Users"/></a></li>
					</ul>
				</div>
				<form class="navbar-form pull-right">
					<button onclick=" $('#login').modal('show');"  class="btn btn-primary" ng-hide="user.username"><g:message code="myapp.Login"/></button>
                    <span ng-show="user.username"><button ng-click="logout()" class="btn btn-success"><g:message code="myapp.Logout"/></button></span>
                </form>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div ng-class="'alert alert-' + message().type"
			ng-show="message().show">
			<button type="button" class="close" ng-click="message().show = false">&times;</button>
			<msg key-expr="message().text"></msg>
		</div>
		<div id="loading" class="alert alert-info" style="display: none"><g:message code="myapp.Logout"/></div>
		<div class="modal" style="display: none" id="login">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">x</a>
				<h3><g:message code="myapp.Login"/></h3>
			</div>
			<div class="modal-body">
				<div class="control-group">
					<label class="control-label" for="username"><g:message code="myapp.Username"/></label>
					<div class="controls">
						<input type="text" id="username" ng-model="username"
							required="required" class="input-block-level" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="password"><g:message code="myapp.Password"/></label>
					<div class="controls">
						<input type="password" id="password" ng-model="password"
							required="required" class="input-block-level" />
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<a ng-click="login()" class="btn btn-primary"><g:message code="myapp.Login"/></a> <a
					data-dismiss="modal" class="btn"><g:message code="myapp.Cancel"/></a>
			</div>
		</div>
		<ng-view>
		</ng-view>
		<div class="footer">
		</div>
	</div>
	<script type="text/javascript" src="lib/jquery.js"></script>
	<script type="text/javascript" src="lib/jquery.i18n.properties-min-1.0.9.js"></script>
	<script type="text/javascript" src="lib/html5shiv.js"></script>
	<script type="text/javascript" src="lib/holder.js"></script>
	<script type="text/javascript" src="lib/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="lib/angular/angular.js"></script>
	<script type="text/javascript" src="lib/select2/select2.js"></script>
	<script type="text/javascript" src="lib/select2.js"></script>
	<script type="text/javascript" src="lib/ui-bootstrap-tpls.js"></script>
	<script type="text/javascript" src="lib/growl/growl.js"></script>
	<script type="text/javascript" src="lib/growl/growlDirective.js"></script>
	<script type="text/javascript" src="lib/growl/growlFactory.js"></script>

	<script type="text/javascript" src="js/app.js"></script>
	<script type="text/javascript" src="js/services.js"></script>
	<script type="text/javascript" src="js/controllers.js"></script>
	<script type="text/javascript" src="js/filters.js"></script>
	<script type="text/javascript" src="js/directives.js"></script>
	<script type="text/javascript" src="js/jquery.bootstrap.growl.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
</body>
</html>