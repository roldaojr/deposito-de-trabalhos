package trabalhos

import grails.rest.RestfulController
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class UserController extends RestfulController {
	UserController() {
		super(User)
	}
	def view() {
		render(view:"${params.view}")
	}
	def get() {
		def user = User.findByUsername(params.username)
		render user as JSON
	}
}