<div ng-controller="ListCategoriaCtrl">
    <h1 class="page-header"><g:message code="myapp.Categories"/></h1>
    <table class="table">
        <thead>
            <tr>
                <th><g:message code="myapp.Name"/></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr ng-repeat="e in categorias">
                <td>{{e.nome}}</td>
                <td class="col-md-1">
                    <a ng-click="editCategoria($index)"><i class="icon-pencil"></i></a>
                    &nbsp;
                    <a ng-click="delCategoria($index)"><i class="icon-remove-circle"></i></a></td>
            </tr>
        </tbody>
    </table>
    <p>
        <button type="button" class="btn btn-success" 
                ng-click="addCategoria()">
                <b class="icon-plus-sign"></b><g:message code="myapp.AddCategory"/>
        </button>
    </p>
</div>