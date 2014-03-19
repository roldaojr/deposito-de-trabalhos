package trabalhos

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

@Secured(['permitAll'])
class StatusController {
	
	def springSecurityService

	def index() {
		if(springSecurityService.isLoggedIn()) {
			render([user:springSecurityService.currentUser] as JSON)
		}else {
			response.sendError HttpServletResponse.SC_UNAUTHORIZED
		}
	}
	
}
