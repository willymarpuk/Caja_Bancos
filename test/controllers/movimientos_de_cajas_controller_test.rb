require 'test_helper'

class MovimientosDeCajasControllerTest < ActionController::TestCase
  setup do
    @movimientos_de_caja = movimientos_de_cajas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimientos_de_cajas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movimientos_de_caja" do
    assert_difference('MovimientosDeCaja.count') do
      post :create, movimientos_de_caja: { descripcion: @movimientos_de_caja.descripcion, id_caja: @movimientos_de_caja.id_caja, id_cheque_emitido: @movimientos_de_caja.id_cheque_emitido, id_cheque_entrante: @movimientos_de_caja.id_cheque_entrante, id_tipo_de_movimiento: @movimientos_de_caja.id_tipo_de_movimiento, monto_cheque: @movimientos_de_caja.monto_cheque, monto_efectivo: @movimientos_de_caja.monto_efectivo }
    end

    assert_redirected_to movimientos_de_caja_path(assigns(:movimientos_de_caja))
  end

  test "should show movimientos_de_caja" do
    get :show, id: @movimientos_de_caja
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movimientos_de_caja
    assert_response :success
  end

  test "should update movimientos_de_caja" do
    patch :update, id: @movimientos_de_caja, movimientos_de_caja: { descripcion: @movimientos_de_caja.descripcion, id_caja: @movimientos_de_caja.id_caja, id_cheque_emitido: @movimientos_de_caja.id_cheque_emitido, id_cheque_entrante: @movimientos_de_caja.id_cheque_entrante, id_tipo_de_movimiento: @movimientos_de_caja.id_tipo_de_movimiento, monto_cheque: @movimientos_de_caja.monto_cheque, monto_efectivo: @movimientos_de_caja.monto_efectivo }
    assert_redirected_to movimientos_de_caja_path(assigns(:movimientos_de_caja))
  end

  test "should destroy movimientos_de_caja" do
    assert_difference('MovimientosDeCaja.count', -1) do
      delete :destroy, id: @movimientos_de_caja
    end

    assert_redirected_to movimientos_de_cajas_path
  end
end
