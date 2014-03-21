package trabalhos

import grails.rest.RestfulController
import grails.converters.JSON
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class TrabalhoController extends RestfulController {
	TrabalhoController() {
		super(Trabalho)
	}
    def view() {
        render(view:"${params.view}")
    }
    def find() {
        Trabalho.createCriteria()
        respond Trabalho.list {
            Ilike("titulo", "%"+params.q+"%")
            or {
                Ilike("assunto", "%"+params.q+"%")
            } or {
                Ilike("resumo", "%"+params.q+"%")
            }
        }
    }
    def publish(Trabalho trabalhoInstance) {
        trabalhoInstance.aprovado = true
        trabalhoInstance.save()
        render([message: [text: "trabalho_published", type:"success"]] as JSON)
    }
    def show(Trabalho trabalhoInstance) {
    	JSON.use('deep'){
        	respond trabalhoInstance
    	}
    }
    @Transactional
    def update(Trabalho trabalhoInstance) {
        print trabalhoInstance
        if (trabalhoInstance == null) {
            notFound()
            return
        }
        if (trabalhoInstance.hasErrors()) {
            respond trabalhoInstance.errors
            return
        }
        trabalhoInstance.save flush:true, failOnError:true
        render([message: [text: "trabalho_updated", type:"success"]] as JSON)
    }
}