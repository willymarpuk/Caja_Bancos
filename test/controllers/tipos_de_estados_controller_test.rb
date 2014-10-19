require 'test_helper'

class TiposDeEstadosControllerTest < ActionController::TestCase
  setup do
    @tipos_de_estado = tipos_de_estados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_de_estados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipos_de_estado" do
    assert_difference('TiposDeEstado.count') do
      post :create, tipos_de_estado: { descripcion: @tipos_de_estado.descripcion }
    end

    assert_redirected_to tipos_de_estado_path(assigns(:tipos_de_estado))
  end

  test "should show tipos_de_estado" do
    get :show, id: @tipos_de_estado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipos_de_estado
    assert_response :success
  end

  test "should update tipos_de_estado" do
    patch :update, id: @tipos_de_estado, tipos_de_estado: { descripcion: @tipos_de_estado.descripcion }
    assert_redirected_to tipos_de_estado_path(assigns(:tipos_de_estado))
  end

  test "should destroy tipos_de_estado" do
    assert_difference('TiposDeEstado.count', -1) do
      delete :destroy, id: @tipos_de_estado
    end

    assert_redirected_to tipos_de_estados_path
  end
end
