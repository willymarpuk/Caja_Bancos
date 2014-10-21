require 'test_helper'

class CuentasBancariaControllerTest < ActionController::TestCase
  setup do
    @cuentas_bancarium = cuentas_bancaria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cuentas_bancaria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cuentas_bancarium" do
    assert_difference('CuentasBancarium.count') do
      post :create, cuentas_bancarium: { fecha_de_apertura: @cuentas_bancarium.fecha_de_apertura, id_banco: @cuentas_bancarium.id_banco, id_firmante: @cuentas_bancarium.id_firmante, saldo: @cuentas_bancarium.saldo }
    end

    assert_redirected_to cuentas_bancarium_path(assigns(:cuentas_bancarium))
  end

  test "should show cuentas_bancarium" do
    get :show, id: @cuentas_bancarium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cuentas_bancarium
    assert_response :success
  end

  test "should update cuentas_bancarium" do
    patch :update, id: @cuentas_bancarium, cuentas_bancarium: { fecha_de_apertura: @cuentas_bancarium.fecha_de_apertura, id_banco: @cuentas_bancarium.id_banco, id_firmante: @cuentas_bancarium.id_firmante, saldo: @cuentas_bancarium.saldo }
    assert_redirected_to cuentas_bancarium_path(assigns(:cuentas_bancarium))
  end

  test "should destroy cuentas_bancarium" do
    assert_difference('CuentasBancarium.count', -1) do
      delete :destroy, id: @cuentas_bancarium
    end

    assert_redirected_to cuentas_bancaria_path
  end
end
