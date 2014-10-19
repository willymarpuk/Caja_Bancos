class CuentasBancariaController < ApplicationController
  before_action :set_cuentas_bancarium, only: [:show, :edit, :update, :destroy]

  def index
    @cuentas_bancaria = CuentasBancarium.all
    @cuentas_bancarium = CuentasBancarium.new
  end

  def show
  end

  def new
    @cuentas_bancarium = CuentasBancarium.new
  end

  def edit
  end

  def create
    @cuentas_bancarium = CuentasBancarium.new(cuentas_bancarium_params)
    @cuentas_bancarium.save
  end

  def update
    @cuentas_bancarium.update(cuentas_bancarium_params)
  end

  def destroy
    @cuentas_bancarium.destroy
  end

  private
    def set_cuentas_bancarium
      @cuentas_bancarium = CuentasBancarium.find(params[:id])
    end

    def cuentas_bancarium_params
      params.require(:cuentas_bancarium).permit(:id_banco, :fecha_de_apertura, :saldo, :id_firmante)
    end
end
