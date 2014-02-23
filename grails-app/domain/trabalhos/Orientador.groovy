package trabalhos

/**
 * Orientador de um trabalho
 */
class Orientador {
	String nome

	static scaffold = true

	static belongsTo = [trabalho: Trabalho]
	static hasMany = [trabalho: Trabalho]

	static constraints = {
		nome nullable: false, blank: false
	}
}