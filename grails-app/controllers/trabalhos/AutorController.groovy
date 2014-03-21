package trabalhos

import grails.rest.RestfulController
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class AutorController extends RestfulController {
	AutorController() {
		super(Autor)
	}
	def view() {
		render(view:"${params.view}")
	}
    def find() {
        respond Autor.findAllByNomeIlike("%"+params.nome+"%")//, model:[autorInstanceCount: Categoria.count()]
    }
}