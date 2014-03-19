package trabalhos

import grails.rest.RestfulController
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class AutorController extends RestfulController {
	AutorController() {
		super(Autor)
	}
    def find() {
        respond Autor.findAllByNomeIlike("%"+params.nome+"%")//, model:[autorInstanceCount: Categoria.count()]
    }
}