class DetallesBoletaDeDepositosController < ApplicationController
  before_action :set_detalles_boleta_de_deposito, only: [:show, :edit, :update, :destroy]

  def index
    @detalles_boleta_de_depositos = DetallesBoletaDeDeposito.all
    respond_with(@detalles_boleta_de_depositos)
  end

  def show
    respond_with(@detalles_boleta_de_deposito)
  end

  def new
    @detalles_boleta_de_deposito = DetallesBoletaDeDeposito.new
    respond_with(@detalles_boleta_de_deposito)
  end

  def edit
  end

  def create
    @detalles_boleta_de_deposito = DetallesBoletaDeDeposito.new(detalles_boleta_de_deposito_params)
    @detalles_boleta_de_deposito.save
    respond_with(@detalles_boleta_de_deposito)
  end

  def update
    @detalles_boleta_de_deposito.update(detalles_boleta_de_deposito_params)
    respond_with(@detalles_boleta_de_deposito)
  end

  def destroy
    @detalles_boleta_de_deposito.destroy
    respond_with(@detalles_boleta_de_deposito)
  end

  private
    def set_detalles_boleta_de_deposito
      @detalles_boleta_de_deposito = DetallesBoletaDeDeposito.find(params[:id])
    end

    def detalles_boleta_de_deposito_params
      params.require(:detalles_boleta_de_deposito).permit(:id_boleta_de_deposito, :efectivo, :monto, :item, :id_cheque_entrante)
    end
end
