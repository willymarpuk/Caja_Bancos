class CuentasCorrientesVentaController < ApplicationController
  before_action :set_cuentas_corrientes_ventum, only: [:show, :edit, :update, :destroy]

  def index
    @cuentas_corrientes_venta = CuentasCorrientesVentum.all
    @cuentas_corrientes_ventum = CuentasCorrientesVentum.new
        @persona = Persona.new
    @tipos_de_persona = TiposDePersona.new
    @movimientos_de_caja = MovimientosDeCaja.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cuentas_corrientes_venta }
      format.xls { send_data @cuentas_corrientes_venta.to_xls(
      :columns => [:id_persona, :id_caja, :id_movimiento_de_caja, :monto],
      :headers => ["persona", "Caja", "Movimiento de caja", "Monto"] ),
      :filename => 'cuentas_corrientes_ventas.xls' }
      format.pdf { render_cuentas_corrientes_ventas_list(@cuentas_corrientes_venta) }
    end
  end

  def show
    @cuentas_corrientes_venta = CuentasCorrientesVentum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cuentas_corrientes_venta }
    end
  end

  def new
    @cuentas_corrientes_venta = CuentasCorrientesVentum.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cuentas_corrientes_venta }
    end
  end

  def edit
    @cuentas_corrientes_venta= CuentasCorrientesVentum.find(params[:id])
  end

  def create
    @cuentas_corrientes_ventum = CuentasCorrientesVentum.new(cuentas_corrientes_ventum_params)
    respond_to do |format|
      if @cuentas_corrientes_ventum.save
        format.html { redirect_to @cuentas_corrientes_ventum, notice: 'la cuenta corriente venta fue creada exitosamente.' }
        format.json { render :show, status: :created, location: @cuentas_corrientes_ventum }
      else
        format.html { render :new }
        format.json { render json: @cuentas_corrientes_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cuentas_corrientes_ventum.update(cuentas_corrientes_ventum_params)
        format.html { redirect_to @cuentas_corrientes_ventum, notice: 'la cuenta corriente venta fue actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @cuentas_corrientes_ventum }
      else
        format.html { render :edit }
        format.json { render json: @cuentas_corrientes_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cuentas_corrientes_ventum.destroy
    respond_to do |format|
      format.html { redirect_to @cuentas_corrientes_ventum, notice: 'la cuenta corriente venta fue destruida exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cuentas_corrientes_ventum
      @cuentas_corrientes_ventum = CuentasCorrientesVentum.find(params[:id])
    end

    def cuentas_corrientes_ventum_params
      params.require(:cuentas_corrientes_ventum).permit(:id_persona, :id_caja, :id_movimiento_de_caja, :monto)
    end


 def render_cuentas_corrientes_ventas_list(cuenta_corrientes_venta)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'cuenta_corrientes_venta', 'show.tlf')

      cuenta_corrientes_venta.each do |task|
        report.list.add_row do |row|
          row.values persona: task.id_persona,
                     caja: task.id_caja,
                     movimiento_de_caja: task.id_movimiento_de_caja,
                     monto: task.monto
          row.item(:persona).style(:color, 'red')
          row.item(:caja).style(:color, 'red')
          row.item(:movimiento_de_caja).style(:color, 'red')
          row.item(:monto).style(:color, 'red')
        end
      end

      send_data report.generate, filename: 'cuentas corrientes ventas.pdf',
                                 type: 'application/pdf',
                                 disposition: 'attachment'
    end
end
