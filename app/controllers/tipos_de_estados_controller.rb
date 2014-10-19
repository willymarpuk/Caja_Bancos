class TiposDeEstadosController < ApplicationController
  before_action :set_tipos_de_estado, only: [:show, :edit, :update, :destroy]

  def index
    @tipos_de_estados = TiposDeEstado.all
    @tipos_de_estado = TiposDeEstado.new
  end

  def show
  end

  def new
    @tipos_de_estado = TiposDeEstado.new
  end

  def edit
  end

  def create
    @tipos_de_estado = TiposDeEstado.new(tipos_de_estado_params)
    @tipos_de_estado.save
  end

  def update
    @tipos_de_estado.update(tipos_de_estado_params)
  end

  def destroy
    @tipos_de_estado.destroy
  end

  private
    def set_tipos_de_estado
      @tipos_de_estado = TiposDeEstado.find(params[:id])
    end

    def tipos_de_estado_params
      params.require(:tipos_de_estado).permit(:descripcion)
    end
end
