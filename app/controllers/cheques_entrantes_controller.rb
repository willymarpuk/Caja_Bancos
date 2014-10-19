class ChequesEntrantesController < ApplicationController
  before_action :set_cheques_entrante, only: [:show, :edit, :update, :destroy]

  def index
    @cheques_entrantes = ChequesEntrante.all
    @cheques_entrante = ChequesEntrante.new
  end

  def show
  end

  def new
    @cheques_entrante = ChequesEntrante.new
  end

  def edit
  end

  def create
    @cheques_entrante = ChequesEntrante.new(cheques_entrante_params)
    @cheques_entrante.save
  end

  def update
    @cheques_entrante.update(cheques_entrante_params)
  end

  def destroy
    @cheques_entrante.destroy
  end

  private
    def set_cheques_entrante
      @cheques_entrante = ChequesEntrante.find(params[:id])
    end

    def cheques_entrante_params
      params.require(:cheques_entrante).permit(:id_banco, :numero, :monto, :concepto)
    end
end
