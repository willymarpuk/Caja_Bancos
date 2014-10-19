class ChequesEmitidosController < ApplicationController
  before_action :set_cheques_emitido, only: [:show, :edit, :update, :destroy]

  def index
    @cheques_emitidos = ChequesEmitido.all
    @cheques_emitido = ChequesEmitido.new
  end

  def show
  end

  def new
    @cheques_emitido = ChequesEmitido.new
  end

  def edit
  end

  def create
    @cheques_emitido = ChequesEmitido.new(cheques_emitido_params)
    @cheques_emitido.save
  end

  def update
    @cheques_emitido.update(cheques_emitido_params)
  end

  def destroy
    @cheques_emitido.destroy
  end

  private
    def set_cheques_emitido
      @cheques_emitido = ChequesEmitido.find(params[:id])
    end

    def cheques_emitido_params
      params.require(:cheques_emitido).permit(:id_cuenta_bancaria, :id_banco, :fecha, :concepto, :monto)
    end
end
