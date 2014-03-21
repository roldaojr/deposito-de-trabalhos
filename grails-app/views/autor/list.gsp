<div ng-controller="ListAutorCtrl">
    <h1 class="page-header"><g:message code="myapp.Authors"/></h1>
    <table class="table">
        <thead>
            <tr>
                <th><g:message code="myapp.Name"/></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr ng-repeat="e in autores">
                <td>{{e.nome}}</td>
                <td class="col-md-1">
                    <a ng-click="editAutor($index)"><i class="icon-pencil"></i></a>
                    &nbsp;
                    <a ng-click="delAutor($index)"><i class="icon-remove-circle"></i></a></td>
            </tr>
        </tbody>
    </table>
    <p>
        <button type="button" class="btn btn-success" ng-click="addAutor()">
            <b class="icon-plus-sign"></b><g:message code="myapp.AddAuthor"/>
        </button>
    </p>
</div>