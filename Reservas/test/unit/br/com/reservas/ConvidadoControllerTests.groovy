package br.com.reservas



import org.junit.*
import grails.test.mixin.*

@TestFor(ConvidadoController)
@Mock(Convidado)
class ConvidadoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/convidado/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.convidadoInstanceList.size() == 0
        assert model.convidadoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.convidadoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.convidadoInstance != null
        assert view == '/convidado/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/convidado/show/1'
        assert controller.flash.message != null
        assert Convidado.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/convidado/list'

        populateValidParams(params)
        def convidado = new Convidado(params)

        assert convidado.save() != null

        params.id = convidado.id

        def model = controller.show()

        assert model.convidadoInstance == convidado
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/convidado/list'

        populateValidParams(params)
        def convidado = new Convidado(params)

        assert convidado.save() != null

        params.id = convidado.id

        def model = controller.edit()

        assert model.convidadoInstance == convidado
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/convidado/list'

        response.reset()

        populateValidParams(params)
        def convidado = new Convidado(params)

        assert convidado.save() != null

        // test invalid parameters in update
        params.id = convidado.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/convidado/edit"
        assert model.convidadoInstance != null

        convidado.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/convidado/show/$convidado.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        convidado.clearErrors()

        populateValidParams(params)
        params.id = convidado.id
        params.version = -1
        controller.update()

        assert view == "/convidado/edit"
        assert model.convidadoInstance != null
        assert model.convidadoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/convidado/list'

        response.reset()

        populateValidParams(params)
        def convidado = new Convidado(params)

        assert convidado.save() != null
        assert Convidado.count() == 1

        params.id = convidado.id

        controller.delete()

        assert Convidado.count() == 0
        assert Convidado.get(convidado.id) == null
        assert response.redirectedUrl == '/convidado/list'
    }
}
