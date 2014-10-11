require 'test_helper'

class TiposDePersonasControllerTest < ActionController::TestCase
  setup do
    @tipos_de_persona = tipos_de_personas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_de_personas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipos_de_persona" do
    assert_difference('TiposDePersona.count') do
      post :create, tipos_de_persona: { descripcion: @tipos_de_persona.descripcion }
    end

    assert_redirected_to tipos_de_persona_path(assigns(:tipos_de_persona))
  end

  test "should show tipos_de_persona" do
    get :show, id: @tipos_de_persona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipos_de_persona
    assert_response :success
  end

  test "should update tipos_de_persona" do
    patch :update, id: @tipos_de_persona, tipos_de_persona: { descripcion: @tipos_de_persona.descripcion }
    assert_redirected_to tipos_de_persona_path(assigns(:tipos_de_persona))
  end

  test "should destroy tipos_de_persona" do
    assert_difference('TiposDePersona.count', -1) do
      delete :destroy, id: @tipos_de_persona
    end

    assert_redirected_to tipos_de_personas_path
  end
end
