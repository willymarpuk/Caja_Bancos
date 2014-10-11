class CuentasCorrientesVentaController < ApplicationController
  before_action :set_cuentas_corrientes_ventum, only: [:show, :edit, :update, :destroy]

  # GET /cuentas_corrientes_venta
  # GET /cuentas_corrientes_venta.json
  def index
    @cuentas_corrientes_venta = CuentasCorrientesVentum.all
  end

  # GET /cuentas_corrientes_venta/1
  # GET /cuentas_corrientes_venta/1.json
  def show
  end

  # GET /cuentas_corrientes_venta/new
  def new
    @cuentas_corrientes_ventum = CuentasCorrientesVentum.new
  end

  # GET /cuentas_corrientes_venta/1/edit
  def edit
  end

  # POST /cuentas_corrientes_venta
  # POST /cuentas_corrientes_venta.json
  def create
    @cuentas_corrientes_ventum = CuentasCorrientesVentum.new(cuentas_corrientes_ventum_params)

    respond_to do |format|
      if @cuentas_corrientes_ventum.save
        format.html { redirect_to @cuentas_corrientes_ventum, notice: 'Cuentas corrientes ventum was successfully created.' }
        format.json { render :show, status: :created, location: @cuentas_corrientes_ventum }
      else
        format.html { render :new }
        format.json { render json: @cuentas_corrientes_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuentas_corrientes_venta/1
  # PATCH/PUT /cuentas_corrientes_venta/1.json
  def update
    respond_to do |format|
      if @cuentas_corrientes_ventum.update(cuentas_corrientes_ventum_params)
        format.html { redirect_to @cuentas_corrientes_ventum, notice: 'Cuentas corrientes ventum was successfully updated.' }
        format.json { render :show, status: :ok, location: @cuentas_corrientes_ventum }
      else
        format.html { render :edit }
        format.json { render json: @cuentas_corrientes_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuentas_corrientes_venta/1
  # DELETE /cuentas_corrientes_venta/1.json
  def destroy
    @cuentas_corrientes_ventum.destroy
    respond_to do |format|
      format.html { redirect_to cuentas_corrientes_venta_url, notice: 'Cuentas corrientes ventum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuentas_corrientes_ventum
      @cuentas_corrientes_ventum = CuentasCorrientesVentum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuentas_corrientes_ventum_params
      params.require(:cuentas_corrientes_ventum).permit(:id_persona, :id_caja, :id_movimiento_de_caja, :monto)
    end
end
