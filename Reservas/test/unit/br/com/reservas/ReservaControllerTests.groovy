package br.com.reservas



import org.junit.*
import grails.test.mixin.*

@TestFor(ReservaController)
@Mock(Reserva)
class ReservaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/reserva/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.reservaInstanceList.size() == 0
        assert model.reservaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.reservaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.reservaInstance != null
        assert view == '/reserva/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/reserva/show/1'
        assert controller.flash.message != null
        assert Reserva.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/reserva/list'

        populateValidParams(params)
        def reserva = new Reserva(params)

        assert reserva.save() != null

        params.id = reserva.id

        def model = controller.show()

        assert model.reservaInstance == reserva
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/reserva/list'

        populateValidParams(params)
        def reserva = new Reserva(params)

        assert reserva.save() != null

        params.id = reserva.id

        def model = controller.edit()

        assert model.reservaInstance == reserva
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/reserva/list'

        response.reset()

        populateValidParams(params)
        def reserva = new Reserva(params)

        assert reserva.save() != null

        // test invalid parameters in update
        params.id = reserva.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/reserva/edit"
        assert model.reservaInstance != null

        reserva.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/reserva/show/$reserva.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        reserva.clearErrors()

        populateValidParams(params)
        params.id = reserva.id
        params.version = -1
        controller.update()

        assert view == "/reserva/edit"
        assert model.reservaInstance != null
        assert model.reservaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/reserva/list'

        response.reset()

        populateValidParams(params)
        def reserva = new Reserva(params)

        assert reserva.save() != null
        assert Reserva.count() == 1

        params.id = reserva.id

        controller.delete()

        assert Reserva.count() == 0
        assert Reserva.get(reserva.id) == null
        assert response.redirectedUrl == '/reserva/list'
    }
}
