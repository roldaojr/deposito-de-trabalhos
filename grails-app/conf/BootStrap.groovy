import trabalhos.*

class BootStrap {

    def init = { servletContext ->
        def today = new Date()
    	def ar = new Categoria(nome:"Artigos").save()
    	def te = new Categoria(nome:"Teses").save()
    	def di = new Categoria(nome:"Dissertação").save()
    	def pr = new Categoria(nome:"Projeto").save()
    	def jr = new Orientador(nome:"João Rocha").save()
    	def mj = new Orientador(nome:"Maria José").save()
        def js = new Autor(nome:"José Silva").save()
        def fs = new Autor(nome:"Francisco Silva").save()
        def ms = new Autor(nome:"Maria Francisca").save()
        def t1 = new TermoChave(nome:"Palavra 1").save()
        def t2 = new TermoChave(nome:"Palavra 2").save()
        def t3 = new TermoChave(nome:"Palavra 3").save()
        def tr = new Trabalho(titulo:"Trabalho 1", assunto:"Qualquer", orientador:jr,
                     resumo:"resumo", publicado: today-2, enviado:today-1)
        tr.setCategoria(ar)
        tr.addToAutores(js)
        tr.addToAutores(fs)
        tr.addToAutores(ms)
        tr.addToTermos_chave(t1)
        tr.addToTermos_chave(t2)
        tr.addToTermos_chave(t3)
        tr.save(flush:true)

        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()
        def testUser = new User(username:"test", password:"test123")
        testUser.save(flush: true)
        UserRole.create testUser, adminRole, true
        UserRole.create testUser, userRole, true
    }
    def destroy = {
    }
}
	