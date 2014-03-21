package trabalhos
import grails.rest.Resource;
/**
 * Autor de um trabalho
 */
class Autor {
	String nome

	static hasMany = [trabalho: Trabalho]
	static belongsTo = [Trabalho]
	static constraints = {
		nome nullable: false, blank: false
	}
}