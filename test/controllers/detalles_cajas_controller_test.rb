require 'test_helper'

class DetallesCajasControllerTest < ActionController::TestCase
  setup do
    @detalles_caja = detalles_cajas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalles_cajas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalles_caja" do
    assert_difference('DetallesCaja.count') do
      post :create, detalles_caja: { id_caja: @detalles_caja.id_caja, id_cheque_emitido: @detalles_caja.id_cheque_emitido, id_cheque_entrante: @detalles_caja.id_cheque_entrante, monto: @detalles_caja.monto }
    end

    assert_redirected_to detalles_caja_path(assigns(:detalles_caja))
  end

  test "should show detalles_caja" do
    get :show, id: @detalles_caja
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalles_caja
    assert_response :success
  end

  test "should update detalles_caja" do
    patch :update, id: @detalles_caja, detalles_caja: { id_caja: @detalles_caja.id_caja, id_cheque_emitido: @detalles_caja.id_cheque_emitido, id_cheque_entrante: @detalles_caja.id_cheque_entrante, monto: @detalles_caja.monto }
    assert_redirected_to detalles_caja_path(assigns(:detalles_caja))
  end

  test "should destroy detalles_caja" do
    assert_difference('DetallesCaja.count', -1) do
      delete :destroy, id: @detalles_caja
    end

    assert_redirected_to detalles_cajas_path
  end
end
