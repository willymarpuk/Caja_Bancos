class CajasController < ApplicationController
  before_action :set_caja, only: [:show, :edit, :update, :destroy]

  def index
    @cajas = Caja.all
    @caja = Caja.new
  end

  def show
  end

  def new
    @caja = Caja.new
  end

  def edit
  end

  def create
    @caja = Caja.new(caja_params)
    @caja.save
  end

  def update
    @caja.update(caja_params)
  end

  def destroy
    @caja.destroy
  end

  private
    def set_caja
      @caja = Caja.find(params[:id])
    end

    def caja_params
      params.require(:caja).permit(:id_estado, :id_persona, :apertura, :cierre, :saldo_inicial_efectivo, :saldo_final_efectivo, :saldo_inicial_cheque, :saldo_final_cheque)
    end
end
