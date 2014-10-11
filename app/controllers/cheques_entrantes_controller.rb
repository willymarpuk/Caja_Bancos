class ChequesEntrantesController < ApplicationController
  before_action :set_cheques_entrante, only: [:show, :edit, :update, :destroy]

  # GET /cheques_entrantes
  # GET /cheques_entrantes.json
  def index
    @cheques_entrantes = ChequesEntrante.all
  end

  # GET /cheques_entrantes/1
  # GET /cheques_entrantes/1.json
  def show
  end

  # GET /cheques_entrantes/new
  def new
    @cheques_entrante = ChequesEntrante.new
  end

  # GET /cheques_entrantes/1/edit
  def edit
  end

  # POST /cheques_entrantes
  # POST /cheques_entrantes.json
  def create
    @cheques_entrante = ChequesEntrante.new(cheques_entrante_params)

    respond_to do |format|
      if @cheques_entrante.save
        format.html { redirect_to @cheques_entrante, notice: 'Cheques entrante was successfully created.' }
        format.json { render :show, status: :created, location: @cheques_entrante }
      else
        format.html { render :new }
        format.json { render json: @cheques_entrante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cheques_entrantes/1
  # PATCH/PUT /cheques_entrantes/1.json
  def update
    respond_to do |format|
      if @cheques_entrante.update(cheques_entrante_params)
        format.html { redirect_to @cheques_entrante, notice: 'Cheques entrante was successfully updated.' }
        format.json { render :show, status: :ok, location: @cheques_entrante }
      else
        format.html { render :edit }
        format.json { render json: @cheques_entrante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheques_entrantes/1
  # DELETE /cheques_entrantes/1.json
  def destroy
    @cheques_entrante.destroy
    respond_to do |format|
      format.html { redirect_to cheques_entrantes_url, notice: 'Cheques entrante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheques_entrante
      @cheques_entrante = ChequesEntrante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cheques_entrante_params
      params.require(:cheques_entrante).permit(:id_banco, :numero, :monto, :concepto)
    end
end
