package trabalhos
import grails.rest.Resource;
/**
 * Orientador de um trabalho
 */
@Resource()
class Orientador {
	String nome

	static hasMany = [trabalhos: Trabalho]

	static constraints = {
		nome nullable: false, blank: false
	}
}