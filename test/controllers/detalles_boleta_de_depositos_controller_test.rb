require 'test_helper'

class DetallesBoletaDeDepositosControllerTest < ActionController::TestCase
  setup do
    @detalles_boleta_de_deposito = detalles_boleta_de_depositos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalles_boleta_de_depositos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalles_boleta_de_deposito" do
    assert_difference('DetallesBoletaDeDeposito.count') do
      post :create, detalles_boleta_de_deposito: { efectivo: @detalles_boleta_de_deposito.efectivo, id_boleta_de_deposito: @detalles_boleta_de_deposito.id_boleta_de_deposito, monto: @detalles_boleta_de_deposito.monto }
    end

    assert_redirected_to detalles_boleta_de_deposito_path(assigns(:detalles_boleta_de_deposito))
  end

  test "should show detalles_boleta_de_deposito" do
    get :show, id: @detalles_boleta_de_deposito
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalles_boleta_de_deposito
    assert_response :success
  end

  test "should update detalles_boleta_de_deposito" do
    patch :update, id: @detalles_boleta_de_deposito, detalles_boleta_de_deposito: { efectivo: @detalles_boleta_de_deposito.efectivo, id_boleta_de_deposito: @detalles_boleta_de_deposito.id_boleta_de_deposito, monto: @detalles_boleta_de_deposito.monto }
    assert_redirected_to detalles_boleta_de_deposito_path(assigns(:detalles_boleta_de_deposito))
  end

  test "should destroy detalles_boleta_de_deposito" do
    assert_difference('DetallesBoletaDeDeposito.count', -1) do
      delete :destroy, id: @detalles_boleta_de_deposito
    end

    assert_redirected_to detalles_boleta_de_depositos_path
  end
end
