class CajasController < ApplicationController
  before_action :set_caja, only: [:show, :edit, :update, :destroy]

  def index
    @cajas = Caja.all
    @caja = Caja.new
    @tipos_de_estado = TiposDeEstado.new
    @persona = Persona.new
    @tipos_de_persona = TiposDePersona.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cajas }
      format.xls { send_data @cajas.to_xls(
      :columns => [:id_estado, :id_persona, :apertura, :cierre, :saldo_inicial_efectivo, :saldo_final_efectivo, :saldo_inicial_cheque, :saldo_final_cheque],
      :headers => ["Estado", "Persona", "Apertura", "Cierre", "Saldo inicial de efectivo", "Saldo final de efectivo", "Saldo inicial de cheques", "Saldo final de cheques"] ),
      :filename => 'cajas.xls' }
      format.pdf { render_caja_list(@cajas) }
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
        format.html { redirect_to @caja, notice: 'caja was successfully created.' }
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

  def render_caja_list(caja)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'cajas', 'show.tlf')

      caja.each do |task|
        report.list.add_row do |row|
          row.values estado: task.id_estado,
                     persona: task.id_persona,
                     apertura: task.apertura,
                     cierre: task.cierre,
                     saldo_inicial_efectivo: task.saldo_inicial_efectivo,
                     saldo_final_efectivo: task.saldo_final_efectivo,
                     saldo_inicial_cheque: task.saldo_inicial_cheque,
                     saldo_final_cheque: task.saldo_final_cheque
          row.item(:estado).style(:color, 'red')
          row.item(:persona).style(:color, 'red')
          row.item(:apertura).style(:color, 'red')
          row.item(:cierre).style(:color, 'red')
          row.item(:saldo_inicial_efectivo).style(:color, 'red')
          row.item(:saldo_final_efectivo).style(:color, 'red')
          row.item(:saldo_inicial_cheque).style(:color, 'red')
          row.item(:saldo_final_cheque).style(:color, 'red')
        end
      end
      
      send_data report.generate, filename: 'cajas.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
