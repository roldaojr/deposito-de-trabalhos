<div ng-controller="ListTrabalhoCtrl">
    <h1 class="page-header"><g:message code="myapp.Works"/></h1>
    <table class="table">
        <thead>
            <tr>
                <td><g:message code="myapp.Title"/></td>
                <td><g:message code="myapp.Subject"/></td>
                <td><g:message code="myapp.Sent"/></td>
                <td><g:message code="myapp.Approved"/></td>
            </tr>
        </thead>
        <tbody>
            <tr ng-repeat="e in trabalhos">
                <td>{{e.titulo}}</td>
                <td>{{e.assunto}}</td>
                <td>{{e.enviado}}</td>
                <td>{{e.aprovado}}</td>
                <td class="col-md-1">
                    <a title="Publicar" ng-show="trabalho.aprovado == false" ng-click="aprovarTrabalho($index)"><i class="icon-bullhorn"></i></a>
                    &nbsp;
                    <a title="Editar" ng-click="editTrabalho($index)"><i class="icon-pencil"></i></a>
                    &nbsp;
                    <a title="Apagar" ng-click="delTrabalho($index)"><i class="icon-remove-circle"></i></a>
                </td>
            </tr>
        </tbody>
    </table>
    <p>
        <button type="button" class="btn btn-success" ng-click="addTrabalho()">
            <b class="icon-plus-sign"></b>Adicionar Trabalho</button>
    </p>
</div>