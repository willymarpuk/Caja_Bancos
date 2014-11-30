class BoletasDeDepositosController < ApplicationController
  before_action :set_boletas_de_deposito, only: [:show, :edit, :update, :destroy]

  def index
    @boletas_de_depositos = BoletasDeDeposito.all
    @boletas_de_deposito = BoletasDeDeposito.new
    @persona = Persona.new
    @tipos_de_persona = TiposDePersona.new
    @cuentas_bancarium = CuentasBancarium.new
    @banco = Banco.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boletas_de_depositos }
      format.xls { send_data @boletas_de_depositos.to_xls(
      :columns => [:id_banco, :id_persona, :id_cuenta_bancaria, :id_caja, :fecha],
      :headers => ["Banco", "Persona", "Cuenta bancaria", "caja", "Fecha"] ),
      :filename => 'boletas_de_depositos.xls' }
      format.pdf { render_boletas_de_deposito_list(@boletas_de_depositos) }
  end
end

  def show
    @boletas_de_deposito = BoletasDeDeposito.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @boletas_de_deposito }
    end
  end

  def new
    @boletas_de_deposito = BoletasDeDeposito.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @boletas_de_deposito }
  end
  end

  def edit
    @boletas_de_deposito = BoletasDeDeposito.find(params[:id])
  end

 def create
    @boletas_de_deposito = BoletasDeDeposito.new(boletas_de_deposito_params)

    respond_to do |format|
      if @boletas_de_deposito.save
        format.html { redirect_to @boletas_de_deposito, notice: 'boletas_de_deposito was successfully created.' }
        format.json { render :show, status: :created, location: @boletas_de_deposito }
      else
        format.html { render :new }
        format.json { render json: @boletas_de_deposito.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @boletas_de_deposito.update(boletas_de_deposito_params)
        format.html { redirect_to @boletas_de_deposito, notice: 'boletas_de_deposito was successfully updated.' }
        format.json { render :show, status: :ok, location: @boletas_de_deposito }
      else
        format.html { render :edit }
        format.json { render json: @boletas_de_deposito.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @boletas_de_deposito.destroy
    respond_to do |format|
      format.html { redirect_to @boletas_de_deposito, notice: 'boletas_de_deposito was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_boletas_de_deposito
      @boletas_de_deposito = BoletasDeDeposito.find(params[:id])
    end

    def boletas_de_deposito_params
      params.require(:boletas_de_deposito).permit(:id_banco, :id_persona, :id_cuenta_bancaria, :id_caja, :fecha)
    end

    
 def render_boletas_de_deposito_list(boletas_de_deposito)
     report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'boletas_de_depositos', 'show.tlf')
     boletas_de_deposito.each do |task|
       report.list.add_row do |row|
         row.values banco: task.id_banco,
                    persona: task.id_persona,
                    cuenta_bancaria: task.id_cuenta_bancaria,
                    caja: task.id_caja,
                    fecha: task.fecha
         row.item(:banco).style(:color, 'red')
         row.item(:persona).style(:color, 'red')
         row.item(:cuenta_bancaria).style(:color, 'red')
         row.item(:caja).style(:color, 'red')
         row.item(:fecha).style(:color, 'red')
       end
     end
     
     send_data report.generate, filename: 'boletas de depositos.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
   end
end