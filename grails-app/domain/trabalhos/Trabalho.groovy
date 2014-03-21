package trabalhos
import grails.rest.Resource;
/**
 * Trabalho arquivoado no sistema
 */
class Trabalho {
	String titulo     // titulo do trabalho
	String assunto    // assunto
	String resumo     // resumo do trabalho
	Date publicado    // qunado foi publicado o trabalho
	Date enviado      // qunado foi enviado para o repositorio
	Boolean aprovado = Boolean.FALSE  // se o trabalho foi aprovado

	static belongsTo = [
		orientador: Orientador,
		categoria: Categoria,
	]
	static hasMany = [
		autores: Autor,
		termos_chave: TermoChave,
	]
	static constraints = {
		titulo nullable: false, blank: false
		assunto nullable: true
		resumo nullable: true
		publicado nullable: true
	}

	static mapping = {
        orientador lazy: false
        categorias lazy: false
        autores lazy: false
        termos_chave lazy: false
    }
}