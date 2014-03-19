package trabalhos
import grails.rest.Resource;
/**
 * Termo-chave de um trabalho
 */
class TermoChave {
	String nome

	static hasMany = [trabalho: Trabalho]
	static belongsTo = [Trabalho]
	static constraints = {
		nome nullable: false, blank: false
	}
}