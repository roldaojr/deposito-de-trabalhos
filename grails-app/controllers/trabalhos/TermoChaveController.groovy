package trabalhos

import grails.rest.RestfulController
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class TermoChaveController extends RestfulController {
	TermoChaveController() {
		super(TermoChave)
	}
	def view() {
		render(view:"${params.view}")
	}
    def find() {
        respond TermoChave.findAllByNomeIlike("%"+params.nome+"%")
    }
}