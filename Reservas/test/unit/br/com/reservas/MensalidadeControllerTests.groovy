package br.com.reservas



import org.junit.*
import grails.test.mixin.*

@TestFor(MensalidadeController)
@Mock(Mensalidade)
class MensalidadeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/mensalidade/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.mensalidadeInstanceList.size() == 0
        assert model.mensalidadeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.mensalidadeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.mensalidadeInstance != null
        assert view == '/mensalidade/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/mensalidade/show/1'
        assert controller.flash.message != null
        assert Mensalidade.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/mensalidade/list'

        populateValidParams(params)
        def mensalidade = new Mensalidade(params)

        assert mensalidade.save() != null

        params.id = mensalidade.id

        def model = controller.show()

        assert model.mensalidadeInstance == mensalidade
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/mensalidade/list'

        populateValidParams(params)
        def mensalidade = new Mensalidade(params)

        assert mensalidade.save() != null

        params.id = mensalidade.id

        def model = controller.edit()

        assert model.mensalidadeInstance == mensalidade
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/mensalidade/list'

        response.reset()

        populateValidParams(params)
        def mensalidade = new Mensalidade(params)

        assert mensalidade.save() != null

        // test invalid parameters in update
        params.id = mensalidade.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/mensalidade/edit"
        assert model.mensalidadeInstance != null

        mensalidade.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/mensalidade/show/$mensalidade.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        mensalidade.clearErrors()

        populateValidParams(params)
        params.id = mensalidade.id
        params.version = -1
        controller.update()

        assert view == "/mensalidade/edit"
        assert model.mensalidadeInstance != null
        assert model.mensalidadeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/mensalidade/list'

        response.reset()

        populateValidParams(params)
        def mensalidade = new Mensalidade(params)

        assert mensalidade.save() != null
        assert Mensalidade.count() == 1

        params.id = mensalidade.id

        controller.delete()

        assert Mensalidade.count() == 0
        assert Mensalidade.get(mensalidade.id) == null
        assert response.redirectedUrl == '/mensalidade/list'
    }
}
