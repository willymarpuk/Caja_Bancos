require 'test_helper'

class TiposDeMovimientosControllerTest < ActionController::TestCase
  setup do
    @tipos_de_movimiento = tipos_de_movimientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_de_movimientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipos_de_movimiento" do
    assert_difference('TiposDeMovimiento.count') do
      post :create, tipos_de_movimiento: { descripcion: @tipos_de_movimiento.descripcion }
    end

    assert_redirected_to tipos_de_movimiento_path(assigns(:tipos_de_movimiento))
  end

  test "should show tipos_de_movimiento" do
    get :show, id: @tipos_de_movimiento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipos_de_movimiento
    assert_response :success
  end

  test "should update tipos_de_movimiento" do
    patch :update, id: @tipos_de_movimiento, tipos_de_movimiento: { descripcion: @tipos_de_movimiento.descripcion }
    assert_redirected_to tipos_de_movimiento_path(assigns(:tipos_de_movimiento))
  end

  test "should destroy tipos_de_movimiento" do
    assert_difference('TiposDeMovimiento.count', -1) do
      delete :destroy, id: @tipos_de_movimiento
    end

    assert_redirected_to tipos_de_movimientos_path
  end
end
