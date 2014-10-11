class ChequesEmitidosController < ApplicationController
  before_action :set_cheques_emitido, only: [:show, :edit, :update, :destroy]

  # GET /cheques_emitidos
  # GET /cheques_emitidos.json
  def index
    @cheques_emitidos = ChequesEmitido.all
  end

  # GET /cheques_emitidos/1
  # GET /cheques_emitidos/1.json
  def show
  end

  # GET /cheques_emitidos/new
  def new
    @cheques_emitido = ChequesEmitido.new
  end

  # GET /cheques_emitidos/1/edit
  def edit
  end

  # POST /cheques_emitidos
  # POST /cheques_emitidos.json
  def create
    @cheques_emitido = ChequesEmitido.new(cheques_emitido_params)

    respond_to do |format|
      if @cheques_emitido.save
        format.html { redirect_to @cheques_emitido, notice: 'Cheques emitido was successfully created.' }
        format.json { render :show, status: :created, location: @cheques_emitido }
      else
        format.html { render :new }
        format.json { render json: @cheques_emitido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cheques_emitidos/1
  # PATCH/PUT /cheques_emitidos/1.json
  def update
    respond_to do |format|
      if @cheques_emitido.update(cheques_emitido_params)
        format.html { redirect_to @cheques_emitido, notice: 'Cheques emitido was successfully updated.' }
        format.json { render :show, status: :ok, location: @cheques_emitido }
      else
        format.html { render :edit }
        format.json { render json: @cheques_emitido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheques_emitidos/1
  # DELETE /cheques_emitidos/1.json
  def destroy
    @cheques_emitido.destroy
    respond_to do |format|
      format.html { redirect_to cheques_emitidos_url, notice: 'Cheques emitido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheques_emitido
      @cheques_emitido = ChequesEmitido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cheques_emitido_params
      params.require(:cheques_emitido).permit(:id_cuenta_bancaria, :id_banco, :fecha, :concepto, :monto)
    end
end
