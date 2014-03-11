package trabalhos
import grails.rest.Resource;
/**
 * Categoria de um trabalho
 */
@Resource()
class Categoria {
	String nome

	static hasMany = [trabalhos: Trabalho]

	static constraints = {
		nome nullable: false, blank: false
	}
}