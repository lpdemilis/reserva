package br.com.reservas



import org.junit.*
import grails.test.mixin.*

@TestFor(ConviteController)
@Mock(Convite)
class ConviteControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/convite/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.conviteInstanceList.size() == 0
        assert model.conviteInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.conviteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.conviteInstance != null
        assert view == '/convite/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/convite/show/1'
        assert controller.flash.message != null
        assert Convite.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/convite/list'

        populateValidParams(params)
        def convite = new Convite(params)

        assert convite.save() != null

        params.id = convite.id

        def model = controller.show()

        assert model.conviteInstance == convite
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/convite/list'

        populateValidParams(params)
        def convite = new Convite(params)

        assert convite.save() != null

        params.id = convite.id

        def model = controller.edit()

        assert model.conviteInstance == convite
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/convite/list'

        response.reset()

        populateValidParams(params)
        def convite = new Convite(params)

        assert convite.save() != null

        // test invalid parameters in update
        params.id = convite.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/convite/edit"
        assert model.conviteInstance != null

        convite.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/convite/show/$convite.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        convite.clearErrors()

        populateValidParams(params)
        params.id = convite.id
        params.version = -1
        controller.update()

        assert view == "/convite/edit"
        assert model.conviteInstance != null
        assert model.conviteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/convite/list'

        response.reset()

        populateValidParams(params)
        def convite = new Convite(params)

        assert convite.save() != null
        assert Convite.count() == 1

        params.id = convite.id

        controller.delete()

        assert Convite.count() == 0
        assert Convite.get(convite.id) == null
        assert response.redirectedUrl == '/convite/list'
    }
}
