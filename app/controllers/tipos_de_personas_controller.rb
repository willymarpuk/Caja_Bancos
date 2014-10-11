class TiposDePersonasController < ApplicationController
  before_action :set_tipos_de_persona, only: [:show, :edit, :update, :destroy]

  # GET /tipos_de_personas
  # GET /tipos_de_personas.json
  def index
    @tipos_de_personas = TiposDePersona.all
  end

  # GET /tipos_de_personas/1
  # GET /tipos_de_personas/1.json
  def show
  end

  # GET /tipos_de_personas/new
  def new
    @tipos_de_persona = TiposDePersona.new
  end

  # GET /tipos_de_personas/1/edit
  def edit
  end

  # POST /tipos_de_personas
  # POST /tipos_de_personas.json
  def create
    @tipos_de_persona = TiposDePersona.new(tipos_de_persona_params)

    respond_to do |format|
      if @tipos_de_persona.save
        format.html { redirect_to @tipos_de_persona, notice: 'Tipos de persona was successfully created.' }
        format.json { render :show, status: :created, location: @tipos_de_persona }
      else
        format.html { render :new }
        format.json { render json: @tipos_de_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipos_de_personas/1
  # PATCH/PUT /tipos_de_personas/1.json
  def update
    respond_to do |format|
      if @tipos_de_persona.update(tipos_de_persona_params)
        format.html { redirect_to @tipos_de_persona, notice: 'Tipos de persona was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipos_de_persona }
      else
        format.html { render :edit }
        format.json { render json: @tipos_de_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_de_personas/1
  # DELETE /tipos_de_personas/1.json
  def destroy
    @tipos_de_persona.destroy
    respond_to do |format|
      format.html { redirect_to tipos_de_personas_url, notice: 'Tipos de persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipos_de_persona
      @tipos_de_persona = TiposDePersona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipos_de_persona_params
      params.require(:tipos_de_persona).permit(:descripcion)
    end
end
