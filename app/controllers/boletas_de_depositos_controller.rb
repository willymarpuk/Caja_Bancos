class BoletasDeDepositosController < ApplicationController
  before_action :set_boletas_de_deposito, only: [:show, :edit, :update, :destroy]

  # GET /boletas_de_depositos
  # GET /boletas_de_depositos.json
  def index
    @boletas_de_depositos = BoletasDeDeposito.all
  end

  # GET /boletas_de_depositos/1
  # GET /boletas_de_depositos/1.json
  def show
  end

  # GET /boletas_de_depositos/new
  def new
    @boletas_de_deposito = BoletasDeDeposito.new
  end

  # GET /boletas_de_depositos/1/edit
  def edit
  end

  # POST /boletas_de_depositos
  # POST /boletas_de_depositos.json
  def create
    @boletas_de_deposito = BoletasDeDeposito.new(boletas_de_deposito_params)

    respond_to do |format|
      if @boletas_de_deposito.save
        format.html { redirect_to @boletas_de_deposito, notice: 'Boletas de deposito was successfully created.' }
        format.json { render :show, status: :created, location: @boletas_de_deposito }
      else
        format.html { render :new }
        format.json { render json: @boletas_de_deposito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boletas_de_depositos/1
  # PATCH/PUT /boletas_de_depositos/1.json
  def update
    respond_to do |format|
      if @boletas_de_deposito.update(boletas_de_deposito_params)
        format.html { redirect_to @boletas_de_deposito, notice: 'Boletas de deposito was successfully updated.' }
        format.json { render :show, status: :ok, location: @boletas_de_deposito }
      else
        format.html { render :edit }
        format.json { render json: @boletas_de_deposito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boletas_de_depositos/1
  # DELETE /boletas_de_depositos/1.json
  def destroy
    @boletas_de_deposito.destroy
    respond_to do |format|
      format.html { redirect_to boletas_de_depositos_url, notice: 'Boletas de deposito was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boletas_de_deposito
      @boletas_de_deposito = BoletasDeDeposito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boletas_de_deposito_params
      params.require(:boletas_de_deposito).permit(:id_banco, :id_persona, :id_cuenta_bancaria, :id_caja, :id_cheque_entrante, :fecha)
    end
end
