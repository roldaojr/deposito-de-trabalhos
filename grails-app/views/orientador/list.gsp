<div ng-controller="ListOrientadorCtrl">
    <h1 class="page-header"><g:message code="myapp.Leaders"/></h1>
    <table class="table">
        <thead>
            <tr>
                <th><g:message code="myapp.Name"/></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr ng-repeat="e in orientadores">
                <td>{{e.nome}}</td>
                <td class="col-md-1">
                    <a ng-click="editOrientador($index)"><i class="icon-pencil"></i></a>
                    &nbsp;
                    <a ng-click="delOrientador($index)"><i class="icon-remove-circle"></i></a></td>
            </tr>
        </tbody>
    </table>
<!-- ng-show="user.username" -->
    <p>
        <button type="button" class="btn btn-success" 
                ng-click="addOrientador()">
                <b class="icon-plus-sign"></b><g:message code="myapp.AddLeader"/>
        </button>
    </p>
</div>