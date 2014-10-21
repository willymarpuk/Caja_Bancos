class TiposDeMovimientosController < ApplicationController
  before_action :set_tipos_de_movimiento, only: [:show, :edit, :update, :destroy]

  def index
    @tipos_de_movimientos = TiposDeMovimiento.all
    @tipos_de_movimiento = TiposDeMovimiento.new
  end

  def show
  end

  def new
    @tipos_de_movimiento = TiposDeMovimiento.new
  end

  def edit
  end

  def create
    @tipos_de_movimiento = TiposDeMovimiento.new(tipos_de_movimiento_params)
    @tipos_de_movimiento.save
  end

  def update
    @tipos_de_movimiento.update(tipos_de_movimiento_params)
  end

  def destroy
    @tipos_de_movimiento.destroy
  end

  private
    def set_tipos_de_movimiento
      @tipos_de_movimiento = TiposDeMovimiento.find(params[:id])
    end

    def tipos_de_movimiento_params
      params.require(:tipos_de_movimiento).permit(:descripcion, :tipo)
    end
end
