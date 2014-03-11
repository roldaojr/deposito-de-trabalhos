package trabalhos
import grails.rest.Resource;
/**
 * Arquivo de um trabalho
 */
@Resource()
class Arquivo {
	String formato
	Integer tamanho
	String url

	static belongsTo = [trabalho: Trabalho]

	static constraints = {
		formato nullable: false, blank: false
		url nullable: false, blank: false
		tamanho nullable: false, blank: false
	}
}