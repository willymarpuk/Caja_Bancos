class TiposDeEstadosController < ApplicationController
  before_action :set_tipos_de_estado, only: [:show, :edit, :update, :destroy]

  # GET /tipos_de_estados
  # GET /tipos_de_estados.json
  def index
    @tipos_de_estados = TiposDeEstado.all
  end

  # GET /tipos_de_estados/1
  # GET /tipos_de_estados/1.json
  def show
  end

  # GET /tipos_de_estados/new
  def new
    @tipos_de_estado = TiposDeEstado.new
  end

  # GET /tipos_de_estados/1/edit
  def edit
  end

  # POST /tipos_de_estados
  # POST /tipos_de_estados.json
  def create
    @tipos_de_estado = TiposDeEstado.new(tipos_de_estado_params)

    respond_to do |format|
      if @tipos_de_estado.save
        format.html { redirect_to @tipos_de_estado, notice: 'Tipos de estado was successfully created.' }
        format.json { render :show, status: :created, location: @tipos_de_estado }
      else
        format.html { render :new }
        format.json { render json: @tipos_de_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipos_de_estados/1
  # PATCH/PUT /tipos_de_estados/1.json
  def update
    respond_to do |format|
      if @tipos_de_estado.update(tipos_de_estado_params)
        format.html { redirect_to @tipos_de_estado, notice: 'Tipos de estado was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipos_de_estado }
      else
        format.html { render :edit }
        format.json { render json: @tipos_de_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_de_estados/1
  # DELETE /tipos_de_estados/1.json
  def destroy
    @tipos_de_estado.destroy
    respond_to do |format|
      format.html { redirect_to tipos_de_estados_url, notice: 'Tipos de estado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipos_de_estado
      @tipos_de_estado = TiposDeEstado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipos_de_estado_params
      params.require(:tipos_de_estado).permit(:descripcion)
    end
end
