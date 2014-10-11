require 'test_helper'

class ChequesEmitidosControllerTest < ActionController::TestCase
  setup do
    @cheques_emitido = cheques_emitidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheques_emitidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cheques_emitido" do
    assert_difference('ChequesEmitido.count') do
      post :create, cheques_emitido: { concepto: @cheques_emitido.concepto, fecha: @cheques_emitido.fecha, id_banco: @cheques_emitido.id_banco, id_cuenta_bancaria: @cheques_emitido.id_cuenta_bancaria, monto: @cheques_emitido.monto }
    end

    assert_redirected_to cheques_emitido_path(assigns(:cheques_emitido))
  end

  test "should show cheques_emitido" do
    get :show, id: @cheques_emitido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cheques_emitido
    assert_response :success
  end

  test "should update cheques_emitido" do
    patch :update, id: @cheques_emitido, cheques_emitido: { concepto: @cheques_emitido.concepto, fecha: @cheques_emitido.fecha, id_banco: @cheques_emitido.id_banco, id_cuenta_bancaria: @cheques_emitido.id_cuenta_bancaria, monto: @cheques_emitido.monto }
    assert_redirected_to cheques_emitido_path(assigns(:cheques_emitido))
  end

  test "should destroy cheques_emitido" do
    assert_difference('ChequesEmitido.count', -1) do
      delete :destroy, id: @cheques_emitido
    end

    assert_redirected_to cheques_emitidos_path
  end
end
