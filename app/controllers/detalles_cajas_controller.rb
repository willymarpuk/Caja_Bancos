class DetallesCajasController < ApplicationController
  before_action :set_detalles_caja, only: [:show, :edit, :update, :destroy]

  # GET /detalles_cajas
  # GET /detalles_cajas.json
  def index
    @detalles_cajas = DetallesCaja.all
  end

  # GET /detalles_cajas/1
  # GET /detalles_cajas/1.json
  def show
  end

  # GET /detalles_cajas/new
  def new
    @detalles_caja = DetallesCaja.new
  end

  # GET /detalles_cajas/1/edit
  def edit
  end

  # POST /detalles_cajas
  # POST /detalles_cajas.json
  def create
    @detalles_caja = DetallesCaja.new(detalles_caja_params)

    respond_to do |format|
      if @detalles_caja.save
        format.html { redirect_to @detalles_caja, notice: 'Detalles caja was successfully created.' }
        format.json { render :show, status: :created, location: @detalles_caja }
      else
        format.html { render :new }
        format.json { render json: @detalles_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalles_cajas/1
  # PATCH/PUT /detalles_cajas/1.json
  def update
    respond_to do |format|
      if @detalles_caja.update(detalles_caja_params)
        format.html { redirect_to @detalles_caja, notice: 'Detalles caja was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalles_caja }
      else
        format.html { render :edit }
        format.json { render json: @detalles_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalles_cajas/1
  # DELETE /detalles_cajas/1.json
  def destroy
    @detalles_caja.destroy
    respond_to do |format|
      format.html { redirect_to detalles_cajas_url, notice: 'Detalles caja was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalles_caja
      @detalles_caja = DetallesCaja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalles_caja_params
      params.require(:detalles_caja).permit(:id_caja, :id_cheque_emitido, :id_cheque_entrante, :monto)
    end
end
