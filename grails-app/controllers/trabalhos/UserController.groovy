package trabalhos

import grails.rest.RestfulController
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class UserController extends RestfulController {
	UserController() {
		super(User)
	}
}