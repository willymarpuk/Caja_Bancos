require 'test_helper'

class BoletasDeDepositosControllerTest < ActionController::TestCase
  setup do
    @boletas_de_deposito = boletas_de_depositos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boletas_de_depositos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boletas_de_deposito" do
    assert_difference('BoletasDeDeposito.count') do
      post :create, boletas_de_deposito: { fecha: @boletas_de_deposito.fecha, id_banco: @boletas_de_deposito.id_banco, id_caja: @boletas_de_deposito.id_caja, id_cheque_entrante: @boletas_de_deposito.id_cheque_entrante, id_cuenta_bancaria: @boletas_de_deposito.id_cuenta_bancaria, id_persona: @boletas_de_deposito.id_persona }
    end

    assert_redirected_to boletas_de_deposito_path(assigns(:boletas_de_deposito))
  end

  test "should show boletas_de_deposito" do
    get :show, id: @boletas_de_deposito
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boletas_de_deposito
    assert_response :success
  end

  test "should update boletas_de_deposito" do
    patch :update, id: @boletas_de_deposito, boletas_de_deposito: { fecha: @boletas_de_deposito.fecha, id_banco: @boletas_de_deposito.id_banco, id_caja: @boletas_de_deposito.id_caja, id_cheque_entrante: @boletas_de_deposito.id_cheque_entrante, id_cuenta_bancaria: @boletas_de_deposito.id_cuenta_bancaria, id_persona: @boletas_de_deposito.id_persona }
    assert_redirected_to boletas_de_deposito_path(assigns(:boletas_de_deposito))
  end

  test "should destroy boletas_de_deposito" do
    assert_difference('BoletasDeDeposito.count', -1) do
      delete :destroy, id: @boletas_de_deposito
    end

    assert_redirected_to boletas_de_depositos_path
  end
end
