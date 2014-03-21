package trabalhos

import grails.rest.RestfulController
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class OrientadorController extends RestfulController {
	OrientadorController() {
		super(Orientador)
	}
    def view() {
        render(view:"${params.view}")
    }
    def find() {
        respond Orientador.findAllByNomeIlike("%"+params.nome+"%")
    }
}