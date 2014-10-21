class MovimientosDeCajasController < ApplicationController
  before_action :set_movimientos_de_caja, only: [:show, :edit, :update, :destroy]

  def index
    @movimientos_de_cajas = MovimientosDeCaja.all
    @movimientos_de_caja = MovimientosDeCaja.new
  end

  def show
  end

  def new
    @movimientos_de_caja = MovimientosDeCaja.new
  end

  def edit
  end

  def create
    @movimientos_de_caja = MovimientosDeCaja.new(movimientos_de_caja_params)
    @movimientos_de_caja.save
  end

  def update
    @movimientos_de_caja.update(movimientos_de_caja_params)
  end

  def destroy
    @movimientos_de_caja.destroy
  end

  private
    def set_movimientos_de_caja
      @movimientos_de_caja = MovimientosDeCaja.find(params[:id])
    end

    def movimientos_de_caja_params
      params.require(:movimientos_de_caja).permit(:id_tipo_de_movimiento, :id_caja, :id_cheque_entrante, :id_cheque_emitido, :descripcion, :monto_efectivo, :monto_cheque)
    end
end
