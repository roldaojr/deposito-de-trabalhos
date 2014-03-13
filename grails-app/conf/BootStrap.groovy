import trabalhos.Categoria;
import trabalhos.Orientador;
import trabalhos.Autor;
import trabalhos.Trabalho;

class BootStrap {

    def init = { servletContext ->
        def today = new Date()
    	new Categoria(nome:"Artigos").save()
    	new Categoria(nome:"Teses").save()
    	new Categoria(nome:"Dissertação").save()
    	new Categoria(nome:"Projeto").save()
    	new Orientador(nome:"João Rocha").save()
    	new Orientador(nome:"Maria José").save()
        new Trabalho(titulo:"Trabalho 1", assunto:"Qualquer"
                            resumo:"resumo", publicado: today-2, enviado:today-1)
            .addToCategorias(new Categoria(nome:"Categoria 1"))
            .addToCategorias(new Categoria(nome:"Categoria 2"))
            .addToAutores(new Autor(nome:"José Silva"))
            .addToAutores(new Autor(nome:"Francisco Silva"))
            .addToAutores(new Autor(nome:"Maria Francisca"))
            .addToTermos_chave(nome:"Palavra 1")
            .addToTermos_chave(nome:"Palavra 2")
            .addToTermos_chave(nome:"Palavra 3")
            .save(flush:true)
    }
    def destroy = {
    }
}
	