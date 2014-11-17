class CajasController < ApplicationController
  before_action :set_caja, only: [:show, :edit, :update, :destroy]

  def index
    @cajas = Caja.all
    @caja = Caja.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cajas }
      format.xls { send_data @cajas.to_xls, :filename => 'cajas.xls' }
    end
  end

  def show
    @caja = Caja.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caja }
    end
  end

  def new
    @caja = Caja.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caja }
    end
  end

  def edit
      @caja = Caja.find(params[:id])
  end

  def create
    @caja = Caja.new(caja_params)
    respond_to do |format|
      if @caja.save
        format.html { redirect_to caja_path, notice: 'caja was successfully created.' }
        format.json { render :show, status: :created, location: @caja }
      else
        format.html { render :new }
        format.json { render json: @caja.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
   respond_to do |format|
      if @caja.update(caja_params)
        format.html { redirect_to @caja, notice: 'caja was successfully updated.' }
        format.json { render :show, status: :ok, location: @caja }
      else
        format.html { render :edit }
        format.json { render json: @caja.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @caja.destroy
      respond_to do |format|
      format.html { redirect_to @caja, notice: 'caja was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_caja
      @caja = Caja.find(params[:id])
    end

    def caja_params
      params.require(:caja).permit(:id_estado, :id_persona, :apertura, :cierre, :saldo_inicial_efectivo, :saldo_final_efectivo, :saldo_inicial_cheque, :saldo_final_cheque)
    end
end
