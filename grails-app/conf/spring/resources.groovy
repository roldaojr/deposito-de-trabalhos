import grails.rest.render.json.JsonCollectionRenderer
import grails.rest.render.xml.XmlCollectionRenderer
import trabalhos.*

beans = {
	jsonBookCollectionRenderer(JsonCollectionRenderer, Autor)
	xmlBookCollectionRenderer(XmlCollectionRenderer, Autor)
	jsonBookCollectionRenderer(JsonCollectionRenderer, TermoChave)
	xmlBookCollectionRenderer(XmlCollectionRenderer, TermoChave)
}
