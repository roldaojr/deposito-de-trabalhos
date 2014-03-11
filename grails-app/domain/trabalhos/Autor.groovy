package trabalhos
import grails.rest.Resource;
/**
 * Autor de um trabalho
 */
@Resource()
class Autor {
	String nome

	static hasMany = [trabalho: Trabalho]

	static constraints = {
		nome nullable: false, blank: false
	}
}