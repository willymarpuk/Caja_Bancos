class MovimientosDeCajasController < ApplicationController
  before_action :set_movimientos_de_caja, only: [:show, :edit, :update, :destroy]

  def index
    @movimientos_de_cajas = MovimientosDeCaja.all
    @movimientos_de_caja = MovimientosDeCaja.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movimientos_de_cajas }
      format.xls { send_data @movimientos_de_cajas.to_xls(:header => false ), :filename => 'movimientos_de_cajas.xls' }
      format.pdf { render_movimientos_de_cajas_list(@movimientos_de_cajas) }
    end
  end

  def show
    @movimientos_de_caja = MovimientosDeCaja.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movimientos_de_caja }
    end
  end

  def new
    @movimientos_de_caja = MovimientosDeCaja.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movimientos_de_caja }
    end
  end

  def edit
    @movimientos_de_caja= MovimientosDeCaja.find(params[:id])
  end

  def create
    @movimientos_de_caja = MovimientosDeCaja.new(movimientos_de_caja_params)
    respond_to do |format|
      if @movimientos_de_caja.save
        format.html { redirect_to @movimientos_de_caja, notice: 'movimientos_de_caja was successfully created.' }
        format.json { render :show, status: :created, location: @movimientos_de_caja }
      else
        format.html { render :new }
        format.json { render json: @movimientos_de_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movimientos_de_caja.update(movimientos_de_caja_params)
        format.html { redirect_to @movimientos_de_caja, notice: 'movimientos_de_caja was successfully updated.' }
        format.json { render :show, status: :ok, location: @movimientos_de_caja }
      else
        format.html { render :edit }
        format.json { render json: @movimientos_de_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movimientos_de_caja.destroy
    respond_to do |format|
      format.html { redirect_to @movimientos_de_caja, notice: 'movimientos_de_caja was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_movimientos_de_caja
      @movimientos_de_caja = MovimientosDeCaja.find(params[:id])
    end

    def movimientos_de_caja_params
      params.require(:movimientos_de_caja).permit(:id_tipo_de_movimiento, :id_caja, :id_cheque_entrante, :id_cheque_emitido, :descripcion, :monto_efectivo, :monto_cheque)
    end


def render_movimientos_de_cajas_list(movimientos_de_caja)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'movimientos_de_cajas', 'show.tlf')

      movimientos_de_caja.each do |task|
        report.list.add_row do |row|
          row.values tipo_de_movimiento: task.id_tipo_de_movimiento, 
                     caja: task.caja,
                     cheque_entrante: task.id_cheque_entrante,
                     cheque_emitido: task.id_cheque_emitido,
                     descripcion: task.descripcion,
                     monto_efectivo: task.monto_efectivo,
                     monto_cheque: task.monto_cheque                    
          row.item(:tipo_de_movimiento).style(:color, 'red')
          row.item(:caja).style(:color, 'red')
          row.item(:cheque_entrante).style(:color, 'red')
          row.item(:cheque_emitido).style(:color, 'red')
          row.item(:descripcion).style(:color, 'red')
          row.item(:monto_efectivo).style(:color, 'red')
          row.item(:monto_cheque).style(:color, 'red')
        end
      end
      
      send_data report.generate, filename: 'movimientos de cajas.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
