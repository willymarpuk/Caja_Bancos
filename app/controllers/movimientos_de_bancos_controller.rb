class MovimientosDeBancosController < ApplicationController
  before_action :set_movimientos_de_banco, only: [:show, :edit, :update, :destroy]

  def index
    @movimientos_de_bancos = MovimientosDeBanco.all
    @movimientos_de_banco = MovimientosDeBanco.new
    @persona = Persona.new
    @tipos_de_persona = TiposDePersona.new
    @cuentas_bancarium = CuentasBancarium.new
    @banco = Banco.new
    @tipos_de_movimiento = TiposDeMovimiento.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movimientos_de_bancos }
      format.xls { send_data @movimientos_de_bancos.to_xls(
      :columns => [:id_tipo_de_movimiento, :id_banco, :id_cuenta_bancaria, :monto, :descripcion],
      :headers => ["Tipo de movimiento", "Banco", "Cuenta bancaria", "Monto", "Descripcion"] ),
      :filename => 'movimientos_de_bancos.xls' }
      format.pdf { render_movimientos_de_bancos_list(@movimientos_de_bancos) }
    end
  end

  def show
    @movimientos_de_banco = MovimientosDeBanco.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movimientos_de_banco }
    end
  end

  def new
   @movimientos_de_banco = MovimientosDeBanco.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movimientos_de_banco }
    end
  end

  def edit
    @movimientos_de_banco = MovimientosDeBanco.find(params[:id])
  end

  def create
    @movimientos_de_banco = MovimientosDeBanco.new(movimientos_de_banco_params)
    respond_to do |format|
      if @movimientos_de_banco.save
        format.html { redirect_to @movimientos_de_banco, notice: 'movimientos_de_banco was successfully created.' }
        format.json { render :show, status: :created, location: @movimientos_de_banco }
      else
        format.html { render :new }
        format.json { render json: @movimientos_de_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movimientos_de_banco.update(movimientos_de_banco_params)
        format.html { redirect_to @movimientos_de_banco, notice: 'movimientos_de_banco was successfully updated.' }
        format.json { render :show, status: :ok, location: @movimientos_de_banco }
      else
        format.html { render :edit }
        format.json { render json: @movimientos_de_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movimientos_de_banco.destroy
    respond_to do |format|
      format.html { redirect_to @movimientos_de_banco, notice: 'movimientos_de_banco was successfully destroyed.' }
      format.json { head :no_content }
    end  
  end

  private
    def set_movimientos_de_banco
      @movimientos_de_banco = MovimientosDeBanco.find(params[:id])
    end

    def movimientos_de_banco_params
      params.require(:movimientos_de_banco).permit(:id_tipo_de_movimiento, :id_banco, :id_cuenta_bancaria, :descripcion, :monto)
    end

  def render_movimientos_de_bancos_list(movimientos_de_banco)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'movimientos_de_bancos', 'show.tlf')

      movimientos_de_banco.each do |task|
        report.list.add_row do |row|
          row.values tipo_de_movimiento: task.id_tipo_de_movimiento, 
                     banco: task.id_banco,
                     cuenta_bancaria: task.id_cuenta_bancaria,
                     monto: task.monto,
                     descripcion: task.descripcion
          row.item(:tipo_de_movimiento).style(:color, 'red')
          row.item(:banco).style(:color, 'red')
          row.item(:cuenta_bancaria).style(:color, 'red')
          row.item(:monto).style(:color, 'red')
          row.item(:descripcion).style(:color, 'red')
        end
      end
      
      send_data report.generate, filename: 'movimientos de bancos.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
