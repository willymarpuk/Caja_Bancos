require 'test_helper'

class FirmantesControllerTest < ActionController::TestCase
  setup do
    @firmante = firmantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:firmantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create firmante" do
    assert_difference('Firmante.count') do
      post :create, firmante: { nombre: @firmante.nombre }
    end

    assert_redirected_to firmante_path(assigns(:firmante))
  end

  test "should show firmante" do
    get :show, id: @firmante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @firmante
    assert_response :success
  end

  test "should update firmante" do
    patch :update, id: @firmante, firmante: { nombre: @firmante.nombre }
    assert_redirected_to firmante_path(assigns(:firmante))
  end

  test "should destroy firmante" do
    assert_difference('Firmante.count', -1) do
      delete :destroy, id: @firmante
    end

    assert_redirected_to firmantes_path
  end
end
