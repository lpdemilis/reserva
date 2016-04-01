package br.com.reservas



import org.junit.*
import grails.test.mixin.*

@TestFor(PlanoController)
@Mock(Plano)
class PlanoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/plano/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.planoInstanceList.size() == 0
        assert model.planoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.planoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.planoInstance != null
        assert view == '/plano/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/plano/show/1'
        assert controller.flash.message != null
        assert Plano.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/plano/list'

        populateValidParams(params)
        def plano = new Plano(params)

        assert plano.save() != null

        params.id = plano.id

        def model = controller.show()

        assert model.planoInstance == plano
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/plano/list'

        populateValidParams(params)
        def plano = new Plano(params)

        assert plano.save() != null

        params.id = plano.id

        def model = controller.edit()

        assert model.planoInstance == plano
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/plano/list'

        response.reset()

        populateValidParams(params)
        def plano = new Plano(params)

        assert plano.save() != null

        // test invalid parameters in update
        params.id = plano.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/plano/edit"
        assert model.planoInstance != null

        plano.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/plano/show/$plano.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        plano.clearErrors()

        populateValidParams(params)
        params.id = plano.id
        params.version = -1
        controller.update()

        assert view == "/plano/edit"
        assert model.planoInstance != null
        assert model.planoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/plano/list'

        response.reset()

        populateValidParams(params)
        def plano = new Plano(params)

        assert plano.save() != null
        assert Plano.count() == 1

        params.id = plano.id

        controller.delete()

        assert Plano.count() == 0
        assert Plano.get(plano.id) == null
        assert response.redirectedUrl == '/plano/list'
    }
}
