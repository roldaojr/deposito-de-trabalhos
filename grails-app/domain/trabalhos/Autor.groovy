package trabalhos

/**
 * Autor de um trabalho
 */
class Autor {
	String nome

	static belongsTo = [trabalho: Trabalho]
	static hasMany = [trabalho: Trabalho]

	static constraints = {
		nome nullable: false, blank: false
	}
}