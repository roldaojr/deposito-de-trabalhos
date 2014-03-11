package trabalhos
import grails.rest.Resource;
/**
 * Termo-chave de um trabalho
 */
@Resource()
class TermoChave {
	String nome

	static belongsTo = [trabalho: Trabalho]

	static constraints = {
		nome nullable: false, blank: false
	}
}