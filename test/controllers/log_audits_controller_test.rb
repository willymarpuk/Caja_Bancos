require 'test_helper'

class LogAuditsControllerTest < ActionController::TestCase
  setup do
    @log_audit = log_audits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:log_audits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create log_audit" do
    assert_difference('LogAudit.count') do
      post :create, log_audit: { nombre_tabla: @log_audit.nombre_tabla, nombre_usuario: @log_audit.nombre_usuario, operacion: @log_audit.operacion, valor_anterior: @log_audit.valor_anterior, valor_nuevo: @log_audit.valor_nuevo }
    end

    assert_redirected_to log_audit_path(assigns(:log_audit))
  end

  test "should show log_audit" do
    get :show, id: @log_audit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @log_audit
    assert_response :success
  end

  test "should update log_audit" do
    patch :update, id: @log_audit, log_audit: { nombre_tabla: @log_audit.nombre_tabla, nombre_usuario: @log_audit.nombre_usuario, operacion: @log_audit.operacion, valor_anterior: @log_audit.valor_anterior, valor_nuevo: @log_audit.valor_nuevo }
    assert_redirected_to log_audit_path(assigns(:log_audit))
  end

  test "should destroy log_audit" do
    assert_difference('LogAudit.count', -1) do
      delete :destroy, id: @log_audit
    end

    assert_redirected_to log_audits_path
  end
end
