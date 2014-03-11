package trabalhos

import grails.converters.JSON

class StatusController {
	def index() {
		render([user:null] as JSON)
	}
}
