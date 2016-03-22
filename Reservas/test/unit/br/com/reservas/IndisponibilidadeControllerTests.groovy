package br.com.reservas



import org.junit.*
import grails.test.mixin.*

@TestFor(IndisponibilidadeController)
@Mock(Indisponibilidade)
class IndisponibilidadeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/indisponibilidade/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.indisponibilidadeInstanceList.size() == 0
        assert model.indisponibilidadeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.indisponibilidadeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.indisponibilidadeInstance != null
        assert view == '/indisponibilidade/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/indisponibilidade/show/1'
        assert controller.flash.message != null
        assert Indisponibilidade.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/indisponibilidade/list'

        populateValidParams(params)
        def indisponibilidade = new Indisponibilidade(params)

        assert indisponibilidade.save() != null

        params.id = indisponibilidade.id

        def model = controller.show()

        assert model.indisponibilidadeInstance == indisponibilidade
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/indisponibilidade/list'

        populateValidParams(params)
        def indisponibilidade = new Indisponibilidade(params)

        assert indisponibilidade.save() != null

        params.id = indisponibilidade.id

        def model = controller.edit()

        assert model.indisponibilidadeInstance == indisponibilidade
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/indisponibilidade/list'

        response.reset()

        populateValidParams(params)
        def indisponibilidade = new Indisponibilidade(params)

        assert indisponibilidade.save() != null

        // test invalid parameters in update
        params.id = indisponibilidade.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/indisponibilidade/edit"
        assert model.indisponibilidadeInstance != null

        indisponibilidade.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/indisponibilidade/show/$indisponibilidade.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        indisponibilidade.clearErrors()

        populateValidParams(params)
        params.id = indisponibilidade.id
        params.version = -1
        controller.update()

        assert view == "/indisponibilidade/edit"
        assert model.indisponibilidadeInstance != null
        assert model.indisponibilidadeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/indisponibilidade/list'

        response.reset()

        populateValidParams(params)
        def indisponibilidade = new Indisponibilidade(params)

        assert indisponibilidade.save() != null
        assert Indisponibilidade.count() == 1

        params.id = indisponibilidade.id

        controller.delete()

        assert Indisponibilidade.count() == 0
        assert Indisponibilidade.get(indisponibilidade.id) == null
        assert response.redirectedUrl == '/indisponibilidade/list'
    }
}
