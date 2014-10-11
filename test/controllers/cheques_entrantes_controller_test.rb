require 'test_helper'

class ChequesEntrantesControllerTest < ActionController::TestCase
  setup do
    @cheques_entrante = cheques_entrantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheques_entrantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cheques_entrante" do
    assert_difference('ChequesEntrante.count') do
      post :create, cheques_entrante: { concepto: @cheques_entrante.concepto, id_banco: @cheques_entrante.id_banco, monto: @cheques_entrante.monto, numero: @cheques_entrante.numero }
    end

    assert_redirected_to cheques_entrante_path(assigns(:cheques_entrante))
  end

  test "should show cheques_entrante" do
    get :show, id: @cheques_entrante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cheques_entrante
    assert_response :success
  end

  test "should update cheques_entrante" do
    patch :update, id: @cheques_entrante, cheques_entrante: { concepto: @cheques_entrante.concepto, id_banco: @cheques_entrante.id_banco, monto: @cheques_entrante.monto, numero: @cheques_entrante.numero }
    assert_redirected_to cheques_entrante_path(assigns(:cheques_entrante))
  end

  test "should destroy cheques_entrante" do
    assert_difference('ChequesEntrante.count', -1) do
      delete :destroy, id: @cheques_entrante
    end

    assert_redirected_to cheques_entrantes_path
  end
end
