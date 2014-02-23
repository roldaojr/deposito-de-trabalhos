package trabalhos

/**
 * Trabalho arquivoado no sistema
 */
class Trabalho {
	String titulo     // titulo do trabalho
	String assunto    // assunto
	String resumo     // resumo do trabalho
	Date publicado    // qunado foi publicado o trabalho
	Date enviado      // qunado foi enviado para o repositorio
	Boolean aprovado  // se o trabalho foi aprovado

	static belongsTo = [orientador: Orientador]

	static hasMany = [
		termos_chave: TermoChave,
		autores: Autor,
		categorias: Categoria,
	]

	static constraints = {
		titulo nullable: false, blank: false
	}
}