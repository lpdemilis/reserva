package br.com.reservas



import org.junit.*
import grails.test.mixin.*

@TestFor(RecursoController)
@Mock(Recurso)
class RecursoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/recurso/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.recursoInstanceList.size() == 0
        assert model.recursoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.recursoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.recursoInstance != null
        assert view == '/recurso/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/recurso/show/1'
        assert controller.flash.message != null
        assert Recurso.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/recurso/list'

        populateValidParams(params)
        def recurso = new Recurso(params)

        assert recurso.save() != null

        params.id = recurso.id

        def model = controller.show()

        assert model.recursoInstance == recurso
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/recurso/list'

        populateValidParams(params)
        def recurso = new Recurso(params)

        assert recurso.save() != null

        params.id = recurso.id

        def model = controller.edit()

        assert model.recursoInstance == recurso
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/recurso/list'

        response.reset()

        populateValidParams(params)
        def recurso = new Recurso(params)

        assert recurso.save() != null

        // test invalid parameters in update
        params.id = recurso.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/recurso/edit"
        assert model.recursoInstance != null

        recurso.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/recurso/show/$recurso.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        recurso.clearErrors()

        populateValidParams(params)
        params.id = recurso.id
        params.version = -1
        controller.update()

        assert view == "/recurso/edit"
        assert model.recursoInstance != null
        assert model.recursoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/recurso/list'

        response.reset()

        populateValidParams(params)
        def recurso = new Recurso(params)

        assert recurso.save() != null
        assert Recurso.count() == 1

        params.id = recurso.id

        controller.delete()

        assert Recurso.count() == 0
        assert Recurso.get(recurso.id) == null
        assert response.redirectedUrl == '/recurso/list'
    }
}
