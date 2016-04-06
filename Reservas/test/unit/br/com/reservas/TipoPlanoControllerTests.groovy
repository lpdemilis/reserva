package br.com.reservas



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoPlanoController)
@Mock(TipoPlano)
class TipoPlanoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoPlano/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoPlanoInstanceList.size() == 0
        assert model.tipoPlanoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoPlanoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoPlanoInstance != null
        assert view == '/tipoPlano/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoPlano/show/1'
        assert controller.flash.message != null
        assert TipoPlano.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPlano/list'

        populateValidParams(params)
        def tipoPlano = new TipoPlano(params)

        assert tipoPlano.save() != null

        params.id = tipoPlano.id

        def model = controller.show()

        assert model.tipoPlanoInstance == tipoPlano
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPlano/list'

        populateValidParams(params)
        def tipoPlano = new TipoPlano(params)

        assert tipoPlano.save() != null

        params.id = tipoPlano.id

        def model = controller.edit()

        assert model.tipoPlanoInstance == tipoPlano
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPlano/list'

        response.reset()

        populateValidParams(params)
        def tipoPlano = new TipoPlano(params)

        assert tipoPlano.save() != null

        // test invalid parameters in update
        params.id = tipoPlano.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoPlano/edit"
        assert model.tipoPlanoInstance != null

        tipoPlano.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoPlano/show/$tipoPlano.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoPlano.clearErrors()

        populateValidParams(params)
        params.id = tipoPlano.id
        params.version = -1
        controller.update()

        assert view == "/tipoPlano/edit"
        assert model.tipoPlanoInstance != null
        assert model.tipoPlanoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoPlano/list'

        response.reset()

        populateValidParams(params)
        def tipoPlano = new TipoPlano(params)

        assert tipoPlano.save() != null
        assert TipoPlano.count() == 1

        params.id = tipoPlano.id

        controller.delete()

        assert TipoPlano.count() == 0
        assert TipoPlano.get(tipoPlano.id) == null
        assert response.redirectedUrl == '/tipoPlano/list'
    }
}
