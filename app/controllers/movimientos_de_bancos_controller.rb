class MovimientosDeBancosController < ApplicationController
  before_action :set_movimientos_de_banco, only: [:show, :edit, :update, :destroy]

  def index
    @movimientos_de_bancos = MovimientosDeBanco.all
    @movimientos_de_banco = MovimientosDeBanco.new
  end

  def show
  end

  def new
    @movimientos_de_banco = MovimientosDeBanco.new
  end

  def edit
  end

  def create
    @movimientos_de_banco = MovimientosDeBanco.new(movimientos_de_banco_params)
    @movimientos_de_banco.save
  end

  def update
    @movimientos_de_banco.update(movimientos_de_banco_params)
  end

  def destroy
    @movimientos_de_banco.destroy
  end

  private
    def set_movimientos_de_banco
      @movimientos_de_banco = MovimientosDeBanco.find(params[:id])
    end

    def movimientos_de_banco_params
      params.require(:movimientos_de_banco).permit(:id_tipo_de_movimiento, :id_banco, :id_cuenta_bancaria, :descripcion, :monto)
    end
end
