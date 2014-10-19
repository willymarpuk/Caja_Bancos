require 'test_helper'

class MovimientosDeBancosControllerTest < ActionController::TestCase
  setup do
    @movimientos_de_banco = movimientos_de_bancos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimientos_de_bancos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movimientos_de_banco" do
    assert_difference('MovimientosDeBanco.count') do
      post :create, movimientos_de_banco: { descripcion: @movimientos_de_banco.descripcion, id_banco: @movimientos_de_banco.id_banco, id_cuenta_bancaria: @movimientos_de_banco.id_cuenta_bancaria, id_tipo_de_movimiento: @movimientos_de_banco.id_tipo_de_movimiento, monto: @movimientos_de_banco.monto }
    end

    assert_redirected_to movimientos_de_banco_path(assigns(:movimientos_de_banco))
  end

  test "should show movimientos_de_banco" do
    get :show, id: @movimientos_de_banco
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movimientos_de_banco
    assert_response :success
  end

  test "should update movimientos_de_banco" do
    patch :update, id: @movimientos_de_banco, movimientos_de_banco: { descripcion: @movimientos_de_banco.descripcion, id_banco: @movimientos_de_banco.id_banco, id_cuenta_bancaria: @movimientos_de_banco.id_cuenta_bancaria, id_tipo_de_movimiento: @movimientos_de_banco.id_tipo_de_movimiento, monto: @movimientos_de_banco.monto }
    assert_redirected_to movimientos_de_banco_path(assigns(:movimientos_de_banco))
  end

  test "should destroy movimientos_de_banco" do
    assert_difference('MovimientosDeBanco.count', -1) do
      delete :destroy, id: @movimientos_de_banco
    end

    assert_redirected_to movimientos_de_bancos_path
  end
end
