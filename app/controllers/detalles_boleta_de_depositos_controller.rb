class DetallesBoletaDeDepositosController < ApplicationController
  before_action :set_detalles_boleta_de_deposito, only: [:show, :edit, :update, :destroy]

  # GET /detalles_boleta_de_depositos
  # GET /detalles_boleta_de_depositos.json
  def index
    @detalles_boleta_de_depositos = DetallesBoletaDeDeposito.all
  end

  # GET /detalles_boleta_de_depositos/1
  # GET /detalles_boleta_de_depositos/1.json
  def show
  end

  # GET /detalles_boleta_de_depositos/new
  def new
    @detalles_boleta_de_deposito = DetallesBoletaDeDeposito.new
  end

  # GET /detalles_boleta_de_depositos/1/edit
  def edit
  end

  # POST /detalles_boleta_de_depositos
  # POST /detalles_boleta_de_depositos.json
  def create
    @detalles_boleta_de_deposito = DetallesBoletaDeDeposito.new(detalles_boleta_de_deposito_params)

    respond_to do |format|
      if @detalles_boleta_de_deposito.save
        format.html { redirect_to @detalles_boleta_de_deposito, notice: 'Detalles boleta de deposito was successfully created.' }
        format.json { render :show, status: :created, location: @detalles_boleta_de_deposito }
      else
        format.html { render :new }
        format.json { render json: @detalles_boleta_de_deposito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalles_boleta_de_depositos/1
  # PATCH/PUT /detalles_boleta_de_depositos/1.json
  def update
    respond_to do |format|
      if @detalles_boleta_de_deposito.update(detalles_boleta_de_deposito_params)
        format.html { redirect_to @detalles_boleta_de_deposito, notice: 'Detalles boleta de deposito was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalles_boleta_de_deposito }
      else
        format.html { render :edit }
        format.json { render json: @detalles_boleta_de_deposito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalles_boleta_de_depositos/1
  # DELETE /detalles_boleta_de_depositos/1.json
  def destroy
    @detalles_boleta_de_deposito.destroy
    respond_to do |format|
      format.html { redirect_to detalles_boleta_de_depositos_url, notice: 'Detalles boleta de deposito was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalles_boleta_de_deposito
      @detalles_boleta_de_deposito = DetallesBoletaDeDeposito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalles_boleta_de_deposito_params
      params.require(:detalles_boleta_de_deposito).permit(:id_boleta_de_deposito, :efectivo, :monto)
    end
end
