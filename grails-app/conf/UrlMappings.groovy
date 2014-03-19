class UrlMappings {

	static mappings = {
		"/status"(controller:"status", action:"index", method:"GET")
        /*"/api/categorias"(resources:"categoria")
        "/api/autores"(resources:"autor")
        "/api/orientadores"(resources:"orientador")
        "/api/trabalhos"(resources:"trabalho")*/
        "/categoria/find"(controller: 'find', action: 'categoria', method: 'GET')
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        //"/"(view:"/index")
        "500"(view:'/error')
	}
}
