class DetallesCajasController < ApplicationController
  before_action :set_detalles_caja, only: [:show, :edit, :update, :destroy]

  def index
    @detalles_cajas = DetallesCaja.all
    respond_with(@detalles_cajas)
  end

  def show
    respond_with(@detalles_caja)
  end

  def new
    @detalles_caja = DetallesCaja.new
    respond_with(@detalles_caja)
  end

  def edit
  end

  def create
    @detalles_caja = DetallesCaja.new(detalles_caja_params)
    @detalles_caja.save
    respond_with(@detalles_caja)
  end

  def update
    @detalles_caja.update(detalles_caja_params)
    respond_with(@detalles_caja)
  end

  def destroy
    @detalles_caja.destroy
    respond_with(@detalles_caja)
  end

  private
    def set_detalles_caja
      @detalles_caja = DetallesCaja.find(params[:id])
    end

    def detalles_caja_params
      params.require(:detalles_caja).permit(:id_caja, :id_cheque_emitido, :id_cheque_entrante, :monto, :item)
    end
end
