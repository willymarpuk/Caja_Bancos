class BoletasDeDepositosController < ApplicationController
  before_action :set_boletas_de_deposito, only: [:show, :edit, :update, :destroy]

  def index
    @boletas_de_depositos = BoletasDeDeposito.all
    @boletas_de_deposito = BoletasDeDeposito.new
  end

  def show
  end

  def new
    @boletas_de_deposito = BoletasDeDeposito.new
  end

  def edit
  end

  def create
    @boletas_de_deposito = BoletasDeDeposito.new(boletas_de_deposito_params)
    @boletas_de_deposito.save
  end

  def update
    @boletas_de_deposito.update(boletas_de_deposito_params)
  end

  def destroy
    @boletas_de_deposito.destroy
  end

  private
    def set_boletas_de_deposito
      @boletas_de_deposito = BoletasDeDeposito.find(params[:id])
    end

    def boletas_de_deposito_params
      params.require(:boletas_de_deposito).permit(:id_banco, :id_persona, :id_cuenta_bancaria, :id_caja, :fecha)
    end
end
