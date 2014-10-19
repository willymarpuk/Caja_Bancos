class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]

  def index
    @personas = Persona.all
    @persona = Persona.new
  end

  def show
  end

  def new
    @persona = Persona.new
  end

  def edit
  end

  def create
    @persona = Persona.new(persona_params)
    @persona.save
  end

  def update
    @persona.update(persona_params)
  end

  def destroy
    @persona.destroy
  end

  private
    def set_persona
      @persona = Persona.find(params[:id])
    end

    def persona_params
      params.require(:persona).permit(:id_tipo_de_persona, :nombre, :direccion, :localidad, :departamento, :telefono)
    end
end
