package br.com.reservas



import org.junit.*
import grails.test.mixin.*

@TestFor(CondominioController)
@Mock(Condominio)
class CondominioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/condominio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.condominioInstanceList.size() == 0
        assert model.condominioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.condominioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.condominioInstance != null
        assert view == '/condominio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/condominio/show/1'
        assert controller.flash.message != null
        assert Condominio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/condominio/list'

        populateValidParams(params)
        def condominio = new Condominio(params)

        assert condominio.save() != null

        params.id = condominio.id

        def model = controller.show()

        assert model.condominioInstance == condominio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/condominio/list'

        populateValidParams(params)
        def condominio = new Condominio(params)

        assert condominio.save() != null

        params.id = condominio.id

        def model = controller.edit()

        assert model.condominioInstance == condominio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/condominio/list'

        response.reset()

        populateValidParams(params)
        def condominio = new Condominio(params)

        assert condominio.save() != null

        // test invalid parameters in update
        params.id = condominio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/condominio/edit"
        assert model.condominioInstance != null

        condominio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/condominio/show/$condominio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        condominio.clearErrors()

        populateValidParams(params)
        params.id = condominio.id
        params.version = -1
        controller.update()

        assert view == "/condominio/edit"
        assert model.condominioInstance != null
        assert model.condominioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/condominio/list'

        response.reset()

        populateValidParams(params)
        def condominio = new Condominio(params)

        assert condominio.save() != null
        assert Condominio.count() == 1

        params.id = condominio.id

        controller.delete()

        assert Condominio.count() == 0
        assert Condominio.get(condominio.id) == null
        assert response.redirectedUrl == '/condominio/list'
    }
}
