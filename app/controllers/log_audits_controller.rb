class LogAuditsController < ApplicationController
  before_action :set_log_audit, only: [:show, :edit, :update, :destroy]

  def index
    @log_audits = LogAudit.all
  end

  def show
    respond_with(@log_audit)
  end

  def new
    @log_audit = LogAudit.new
    respond_with(@log_audit)
  end

  def edit
  end

  def create
    @log_audit = LogAudit.new(log_audit_params)
    @log_audit.save
    respond_with(@log_audit)
  end

  def update
    @log_audit.update(log_audit_params)
    respond_with(@log_audit)
  end

  def destroy
    @log_audit.destroy
  end

  private
    def set_log_audit
      @log_audit = LogAudit.find(params[:id])
    end

    def log_audit_params
      params.require(:log_audit).permit(:nombre_tabla, :operacion, :valor_anterior, :valor_nuevo, :nombre_usuario)
    end
end
