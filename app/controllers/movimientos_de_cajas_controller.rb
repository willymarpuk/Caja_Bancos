class MovimientosDeCajasController < ApplicationController
  before_action :set_movimientos_de_caja, only: [:show, :edit, :update, :destroy]

  # GET /movimientos_de_cajas
  # GET /movimientos_de_cajas.json
  def index
    @movimientos_de_cajas = MovimientosDeCaja.all
  end

  # GET /movimientos_de_cajas/1
  # GET /movimientos_de_cajas/1.json
  def show
  end

  # GET /movimientos_de_cajas/new
  def new
    @movimientos_de_caja = MovimientosDeCaja.new
  end

  # GET /movimientos_de_cajas/1/edit
  def edit
  end

  # POST /movimientos_de_cajas
  # POST /movimientos_de_cajas.json
  def create
    @movimientos_de_caja = MovimientosDeCaja.new(movimientos_de_caja_params)

    respond_to do |format|
      if @movimientos_de_caja.save
        format.html { redirect_to @movimientos_de_caja, notice: 'Movimientos de caja was successfully created.' }
        format.json { render :show, status: :created, location: @movimientos_de_caja }
      else
        format.html { render :new }
        format.json { render json: @movimientos_de_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimientos_de_cajas/1
  # PATCH/PUT /movimientos_de_cajas/1.json
  def update
    respond_to do |format|
      if @movimientos_de_caja.update(movimientos_de_caja_params)
        format.html { redirect_to @movimientos_de_caja, notice: 'Movimientos de caja was successfully updated.' }
        format.json { render :show, status: :ok, location: @movimientos_de_caja }
      else
        format.html { render :edit }
        format.json { render json: @movimientos_de_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimientos_de_cajas/1
  # DELETE /movimientos_de_cajas/1.json
  def destroy
    @movimientos_de_caja.destroy
    respond_to do |format|
      format.html { redirect_to movimientos_de_cajas_url, notice: 'Movimientos de caja was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimientos_de_caja
      @movimientos_de_caja = MovimientosDeCaja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimientos_de_caja_params
      params.require(:movimientos_de_caja).permit(:id_tipo_de_movimiento, :id_caja, :id_cheque_entrante, :id_cheque_emitido, :descripcion, :monto_efectivo, :monto_cheque)
    end
end
