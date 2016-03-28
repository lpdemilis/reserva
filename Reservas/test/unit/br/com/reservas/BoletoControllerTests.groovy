package br.com.reservas



import org.junit.*
import grails.test.mixin.*

@TestFor(BoletoController)
@Mock(Boleto)
class BoletoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/boleto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.boletoInstanceList.size() == 0
        assert model.boletoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.boletoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.boletoInstance != null
        assert view == '/boleto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/boleto/show/1'
        assert controller.flash.message != null
        assert Boleto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/boleto/list'

        populateValidParams(params)
        def boleto = new Boleto(params)

        assert boleto.save() != null

        params.id = boleto.id

        def model = controller.show()

        assert model.boletoInstance == boleto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/boleto/list'

        populateValidParams(params)
        def boleto = new Boleto(params)

        assert boleto.save() != null

        params.id = boleto.id

        def model = controller.edit()

        assert model.boletoInstance == boleto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/boleto/list'

        response.reset()

        populateValidParams(params)
        def boleto = new Boleto(params)

        assert boleto.save() != null

        // test invalid parameters in update
        params.id = boleto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/boleto/edit"
        assert model.boletoInstance != null

        boleto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/boleto/show/$boleto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        boleto.clearErrors()

        populateValidParams(params)
        params.id = boleto.id
        params.version = -1
        controller.update()

        assert view == "/boleto/edit"
        assert model.boletoInstance != null
        assert model.boletoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/boleto/list'

        response.reset()

        populateValidParams(params)
        def boleto = new Boleto(params)

        assert boleto.save() != null
        assert Boleto.count() == 1

        params.id = boleto.id

        controller.delete()

        assert Boleto.count() == 0
        assert Boleto.get(boleto.id) == null
        assert response.redirectedUrl == '/boleto/list'
    }
}
