class CuentasBancariaController < ApplicationController
  before_action :set_cuentas_bancarium, only: [:show, :edit, :update, :destroy]

  def index
    @cuentas_bancaria = CuentasBancarium.all
    @cuentas_bancarium = CuentasBancarium.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cuentas_bancaria }
      format.xls { send_data @cuentas_bancaria.to_xls(:header => false ), :filename => 'cuentas_bancarias.xls' }
      format.pdf { render_cuentas_bancaria_list(@cuentas_bancaria) }
    end
  end

  def show
    @cuentas_bancaria = CuentasBancarium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cuentas_bancaria }
    end
  end

  def new
   @cuentas_bancaria = CuentasBancarium.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cuentas_bancaria }
    end
  end

  def edit
    @cuentas_bancaria= CuentasBancarium.find(params[:id])
  end

  def create
    @cuentas_bancarium = CuentasBancarium.new(cuentas_bancarium_params)
    respond_to do |format|
      if @cuentas_bancarium.save
        format.html { redirect_to @cuentas_bancarium, notice: 'cuentas_bancarias was successfully created.' }
        format.json { render :show, status: :created, location: @cuentas_bancarium }
      else
        format.html { render :new }
        format.json { render json: @cuentas_bancarium.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cuentas_bancarium.update(cuentas_bancarium_params)
        format.html { redirect_to @cuentas_bancarium, notice: 'cuentas_bancarias was successfully updated.' }
        format.json { render :show, status: :ok, location: @cuentas_bancarium }
      else
        format.html { render :edit }
        format.json { render json: @cuentas_bancarium.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
   @cuentas_bancarium.destroy
    respond_to do |format|
      format.html { redirect_to @cuentas_bancarium, notice: 'cuentas_bancarias was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cuentas_bancarium
      @cuentas_bancarium = CuentasBancarium.find(params[:id])
    end

    def cuentas_bancarium_params
      params.require(:cuentas_bancarium).permit(:id_banco, :fecha_de_apertura, :saldo, :id_firmante)
    end

 def render_cuentas_bancaria_list(cuenta_bancaria)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'cuenta_bancaria', 'show.tlf')

      cuenta_bancaria.each do |task|
        report.list.add_row do |row|
          row.values banco: task.id_banco, 
                     fecha_de_apertura: task.fecha_de_apertura,
                     saldo: task.saldo,
                     firmante: task.id_firmante
          row.item(:banco).style(:color, 'red')
          row.item(:fecha_de_apertura).style(:color, 'red')
          row.item(:saldo).style(:color, 'red')
          row.item(:firmante).style(:color, 'red')
        end
      end
      
      send_data report.generate, filename: 'cuentas bancarias.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
