class CuentasCorrientesVentaController < ApplicationController
  before_action :set_cuentas_corrientes_ventum, only: [:show, :edit, :update, :destroy]

  def index
    @cuentas_corrientes_venta = CuentasCorrientesVentum.all
    @cuentas_corrientes_ventum = CuentasCorrientesVentum.new
  end

  def show
  end

  def new
    @cuentas_corrientes_ventum = CuentasCorrientesVentum.new
  end

  def edit
  end

  def create
    @cuentas_corrientes_ventum = CuentasCorrientesVentum.new(cuentas_corrientes_ventum_params)
    @cuentas_corrientes_ventum.save
  end

  def update
    @cuentas_corrientes_ventum.update(cuentas_corrientes_ventum_params)
  end

  def destroy
    @cuentas_corrientes_ventum.destroy
  end

  private
    def set_cuentas_corrientes_ventum
      @cuentas_corrientes_ventum = CuentasCorrientesVentum.find(params[:id])
    end

    def cuentas_corrientes_ventum_params
      params.require(:cuentas_corrientes_ventum).permit(:id_persona, :id_caja, :id_movimiento_de_caja, :monto)
    end
end
