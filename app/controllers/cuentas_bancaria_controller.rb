class CuentasBancariaController < ApplicationController
  before_action :set_cuentas_bancarium, only: [:show, :edit, :update, :destroy]

  # GET /cuentas_bancaria
  # GET /cuentas_bancaria.json
  def index
    @cuentas_bancaria = CuentasBancarium.all
  end

  # GET /cuentas_bancaria/1
  # GET /cuentas_bancaria/1.json
  def show
  end

  # GET /cuentas_bancaria/new
  def new
    @cuentas_bancarium = CuentasBancarium.new
  end

  # GET /cuentas_bancaria/1/edit
  def edit
  end

  # POST /cuentas_bancaria
  # POST /cuentas_bancaria.json
  def create
    @cuentas_bancarium = CuentasBancarium.new(cuentas_bancarium_params)

    respond_to do |format|
      if @cuentas_bancarium.save
        format.html { redirect_to @cuentas_bancarium, notice: 'Cuentas bancarium was successfully created.' }
        format.json { render :show, status: :created, location: @cuentas_bancarium }
      else
        format.html { render :new }
        format.json { render json: @cuentas_bancarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuentas_bancaria/1
  # PATCH/PUT /cuentas_bancaria/1.json
  def update
    respond_to do |format|
      if @cuentas_bancarium.update(cuentas_bancarium_params)
        format.html { redirect_to @cuentas_bancarium, notice: 'Cuentas bancarium was successfully updated.' }
        format.json { render :show, status: :ok, location: @cuentas_bancarium }
      else
        format.html { render :edit }
        format.json { render json: @cuentas_bancarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuentas_bancaria/1
  # DELETE /cuentas_bancaria/1.json
  def destroy
    @cuentas_bancarium.destroy
    respond_to do |format|
      format.html { redirect_to cuentas_bancaria_url, notice: 'Cuentas bancarium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuentas_bancarium
      @cuentas_bancarium = CuentasBancarium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuentas_bancarium_params
      params.require(:cuentas_bancarium).permit(:id_banco, :fecha_de_apertura, :saldo)
    end
end
