package br.com.reservas



import org.junit.*
import grails.test.mixin.*

@TestFor(ApartamentoController)
@Mock(Apartamento)
class ApartamentoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/apartamento/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.apartamentoInstanceList.size() == 0
        assert model.apartamentoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.apartamentoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.apartamentoInstance != null
        assert view == '/apartamento/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/apartamento/show/1'
        assert controller.flash.message != null
        assert Apartamento.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/apartamento/list'

        populateValidParams(params)
        def apartamento = new Apartamento(params)

        assert apartamento.save() != null

        params.id = apartamento.id

        def model = controller.show()

        assert model.apartamentoInstance == apartamento
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/apartamento/list'

        populateValidParams(params)
        def apartamento = new Apartamento(params)

        assert apartamento.save() != null

        params.id = apartamento.id

        def model = controller.edit()

        assert model.apartamentoInstance == apartamento
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/apartamento/list'

        response.reset()

        populateValidParams(params)
        def apartamento = new Apartamento(params)

        assert apartamento.save() != null

        // test invalid parameters in update
        params.id = apartamento.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/apartamento/edit"
        assert model.apartamentoInstance != null

        apartamento.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/apartamento/show/$apartamento.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        apartamento.clearErrors()

        populateValidParams(params)
        params.id = apartamento.id
        params.version = -1
        controller.update()

        assert view == "/apartamento/edit"
        assert model.apartamentoInstance != null
        assert model.apartamentoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/apartamento/list'

        response.reset()

        populateValidParams(params)
        def apartamento = new Apartamento(params)

        assert apartamento.save() != null
        assert Apartamento.count() == 1

        params.id = apartamento.id

        controller.delete()

        assert Apartamento.count() == 0
        assert Apartamento.get(apartamento.id) == null
        assert response.redirectedUrl == '/apartamento/list'
    }
}
