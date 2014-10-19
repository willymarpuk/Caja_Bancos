class TiposDePersonasController < ApplicationController
  before_action :set_tipos_de_persona, only: [:show, :edit, :update, :destroy]

  def index
    @tipos_de_personas = TiposDePersona.all
    @tipos_de_persona = TiposDePersona.new
  end

  def show
  end

  def new
    @tipos_de_persona = TiposDePersona.new
  end

  def edit
  end

  def create
    @tipos_de_persona = TiposDePersona.new(tipos_de_persona_params)
    @tipos_de_persona.save
  end

  def update
    @tipos_de_persona.update(tipos_de_persona_params)
  end

  def destroy
    @tipos_de_persona.destroy
  end

  private
    def set_tipos_de_persona
      @tipos_de_persona = TiposDePersona.find(params[:id])
    end

    def tipos_de_persona_params
      params.require(:tipos_de_persona).permit(:descripcion)
    end
end
