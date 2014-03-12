package trabalhos
import grails.rest.Resource;
/**
 * Categoria de um trabalho
 */
@Resource(uri='/api/categorias')
class Categoria {
	String nome

	static hasMany = [trabalhos: Trabalho]

	static belongsTo = [Trabalho]

	static constraints = {
		nome nullable: false, blank: false
	}
}