class MovimientosDeBancosController < ApplicationController
  before_action :set_movimientos_de_banco, only: [:show, :edit, :update, :destroy]

  # GET /movimientos_de_bancos
  # GET /movimientos_de_bancos.json
  def index
    @movimientos_de_bancos = MovimientosDeBanco.all
  end

  # GET /movimientos_de_bancos/1
  # GET /movimientos_de_bancos/1.json
  def show
  end

  # GET /movimientos_de_bancos/new
  def new
    @movimientos_de_banco = MovimientosDeBanco.new
  end

  # GET /movimientos_de_bancos/1/edit
  def edit
  end

  # POST /movimientos_de_bancos
  # POST /movimientos_de_bancos.json
  def create
    @movimientos_de_banco = MovimientosDeBanco.new(movimientos_de_banco_params)

    respond_to do |format|
      if @movimientos_de_banco.save
        format.html { redirect_to @movimientos_de_banco, notice: 'Movimientos de banco was successfully created.' }
        format.json { render :show, status: :created, location: @movimientos_de_banco }
      else
        format.html { render :new }
        format.json { render json: @movimientos_de_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimientos_de_bancos/1
  # PATCH/PUT /movimientos_de_bancos/1.json
  def update
    respond_to do |format|
      if @movimientos_de_banco.update(movimientos_de_banco_params)
        format.html { redirect_to @movimientos_de_banco, notice: 'Movimientos de banco was successfully updated.' }
        format.json { render :show, status: :ok, location: @movimientos_de_banco }
      else
        format.html { render :edit }
        format.json { render json: @movimientos_de_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimientos_de_bancos/1
  # DELETE /movimientos_de_bancos/1.json
  def destroy
    @movimientos_de_banco.destroy
    respond_to do |format|
      format.html { redirect_to movimientos_de_bancos_url, notice: 'Movimientos de banco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimientos_de_banco
      @movimientos_de_banco = MovimientosDeBanco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimientos_de_banco_params
      params.require(:movimientos_de_banco).permit(:id_tipo_de_movimiento, :id_banco, :id_cuenta_bancaria, :descripcion, :monto)
    end
end
