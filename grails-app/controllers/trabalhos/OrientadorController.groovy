package trabalhos

import grails.rest.RestfulController
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class OrientadorController extends RestfulController {
	OrientadorController() {
		super(Orientador)
	}
    def find() {
        respond Orientador.findAllByNomeIlike("%"+params.nome+"%")
    }
}