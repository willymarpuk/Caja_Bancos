require 'test_helper'

class CuentasCorrientesVentaControllerTest < ActionController::TestCase
  setup do
    @cuentas_corrientes_ventum = cuentas_corrientes_venta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cuentas_corrientes_venta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cuentas_corrientes_ventum" do
    assert_difference('CuentasCorrientesVentum.count') do
      post :create, cuentas_corrientes_ventum: { id_caja: @cuentas_corrientes_ventum.id_caja, id_movimiento_de_caja: @cuentas_corrientes_ventum.id_movimiento_de_caja, id_persona: @cuentas_corrientes_ventum.id_persona, monto: @cuentas_corrientes_ventum.monto }
    end

    assert_redirected_to cuentas_corrientes_ventum_path(assigns(:cuentas_corrientes_ventum))
  end

  test "should show cuentas_corrientes_ventum" do
    get :show, id: @cuentas_corrientes_ventum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cuentas_corrientes_ventum
    assert_response :success
  end

  test "should update cuentas_corrientes_ventum" do
    patch :update, id: @cuentas_corrientes_ventum, cuentas_corrientes_ventum: { id_caja: @cuentas_corrientes_ventum.id_caja, id_movimiento_de_caja: @cuentas_corrientes_ventum.id_movimiento_de_caja, id_persona: @cuentas_corrientes_ventum.id_persona, monto: @cuentas_corrientes_ventum.monto }
    assert_redirected_to cuentas_corrientes_ventum_path(assigns(:cuentas_corrientes_ventum))
  end

  test "should destroy cuentas_corrientes_ventum" do
    assert_difference('CuentasCorrientesVentum.count', -1) do
      delete :destroy, id: @cuentas_corrientes_ventum
    end

    assert_redirected_to cuentas_corrientes_venta_path
  end
end
