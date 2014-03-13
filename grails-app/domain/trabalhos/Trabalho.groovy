package trabalhos
import grails.rest.Resource;
/**
 * Trabalho arquivoado no sistema
 */
@Resource(uri='/api/trabalhos')
class Trabalho {
	String titulo     // titulo do trabalho
	String assunto    // assunto
	String resumo     // resumo do trabalho
	Date publicado    // qunado foi publicado o trabalho
	Date enviado      // qunado foi enviado para o repositorio
	Boolean aprovado = Boolean.FALSE  // se o trabalho foi aprovado

	static belongsTo = [
		orientador: Orientador
	]

	static hasMany = [
		categorias: Categoria,
		autores: Autor,
		termos_chave: TermoChave,
	]

	static constraints = {
		titulo nullable: false, blank: false
	}
}