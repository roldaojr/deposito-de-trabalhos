import trabalhos.Categoria;
import trabalhos.Orientador;
import trabalhos.Autor;
import trabalhos.Trabalho;

class BootStrap {

    def init = { servletContext ->
    	new Categoria(nome:"Artigos").save()
    	new Categoria(nome:"Teses").save()
    	new Categoria(nome:"Dissertação").save()
    	new Categoria(nome:"Projeto").save()
    	new Orientador(nome:"João Rocha").save()
    	new Orientador(nome:"Maria José").save()
    	new Autor(nome:"José Silva").save()
    	new Autor(nome:"Francisco Silva").save()
    	new Autor(nome:"Maria Francisca").save(flush:true)
    }
    def destroy = {
    }
}
	