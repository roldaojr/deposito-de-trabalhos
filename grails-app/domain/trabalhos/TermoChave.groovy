package trabalhos

/**
 * Termo-chave de um trabalho
 */
class TermoChave {
	String nome

	static belongsTo = [trabalho: Trabalho]
	static hasMany = [trabalho: Trabalho]

	static constraints = {
		nome nullable: false, blank: false
	}
}