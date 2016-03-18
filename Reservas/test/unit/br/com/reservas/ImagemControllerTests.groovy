package br.com.reservas



import org.junit.*
import grails.test.mixin.*

@TestFor(ImagemController)
@Mock(Imagem)
class ImagemControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/imagem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.imagemInstanceList.size() == 0
        assert model.imagemInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.imagemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.imagemInstance != null
        assert view == '/imagem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/imagem/show/1'
        assert controller.flash.message != null
        assert Imagem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/imagem/list'

        populateValidParams(params)
        def imagem = new Imagem(params)

        assert imagem.save() != null

        params.id = imagem.id

        def model = controller.show()

        assert model.imagemInstance == imagem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/imagem/list'

        populateValidParams(params)
        def imagem = new Imagem(params)

        assert imagem.save() != null

        params.id = imagem.id

        def model = controller.edit()

        assert model.imagemInstance == imagem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/imagem/list'

        response.reset()

        populateValidParams(params)
        def imagem = new Imagem(params)

        assert imagem.save() != null

        // test invalid parameters in update
        params.id = imagem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/imagem/edit"
        assert model.imagemInstance != null

        imagem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/imagem/show/$imagem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        imagem.clearErrors()

        populateValidParams(params)
        params.id = imagem.id
        params.version = -1
        controller.update()

        assert view == "/imagem/edit"
        assert model.imagemInstance != null
        assert model.imagemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/imagem/list'

        response.reset()

        populateValidParams(params)
        def imagem = new Imagem(params)

        assert imagem.save() != null
        assert Imagem.count() == 1

        params.id = imagem.id

        controller.delete()

        assert Imagem.count() == 0
        assert Imagem.get(imagem.id) == null
        assert response.redirectedUrl == '/imagem/list'
    }
}
