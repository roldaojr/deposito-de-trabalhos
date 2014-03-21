<div ng-controller="ListUsuarioCtrl">
    <h1 class="page-header"><g:message code="myapp.Users"/></h1>
    <table class="table">
        <thead>
            <tr>
                <th><g:message code="myapp.Name"/></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr ng-repeat="u in usuarios">
                <td>{{u.username}}</td>
                <td class="col-md-1">
                    <a ng-click="editUsuario($index)"><i class="icon-pencil"></i></a>
                    &nbsp;
                    <a ng-click="delUsuario($index)"><i class="icon-remove-circle"></i></a></td>
            </tr>
        </tbody>
    </table>
    <p>
        <button type="button" class="btn btn-success" ng-click="addUsuario()">
            <b class="icon-plus-sign"></b><g:message code="myapp.AddUser"/>
        </button>
    </p>
</div>