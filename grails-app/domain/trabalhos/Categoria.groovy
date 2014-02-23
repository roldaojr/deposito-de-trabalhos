package trabalhos

/**
 * Categoria de um trabalho
 */
class Categoria {
	String nome

	static belongsTo = [trabalho: Trabalho]
	static hasMany = [trabalho: Trabalho]

	static constraints = {
		nome nullable: false, blank: false
	}
}