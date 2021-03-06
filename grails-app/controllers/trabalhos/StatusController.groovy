package trabalhos

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

@Secured(['permitAll'])
class StatusController {
	
	def springSecurityService

	def index() {
		if(springSecurityService.isLoggedIn()) {
			def user = springSecurityService.currentUser
			render([user:user,authorities:user.getAuthorities()] as JSON)
		} else {
			//response.sendError HttpServletResponse.SC_UNAUTHORIZED
			render([user:null,authorities:null] as JSON)
		}
	}
}
