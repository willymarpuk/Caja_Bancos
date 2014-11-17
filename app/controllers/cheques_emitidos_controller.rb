class ChequesEmitidosController < ApplicationController
  before_action :set_cheques_emitido, only: [:show, :edit, :update, :destroy]

  def index
    @cheques_emitidos = ChequesEmitido.all
    @cheques_emitido = ChequesEmitido.new
     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cheques_emitidos }
      format.xls { send_data @cheques_emitidos.to_xls(:header => false ), :filename => 'cheques_emitidos.xls' }
      #format.pdf { render_cheques_emitido_list(@cheques_emitidos) }
  end

  def show
    @cheques_emitido = ChequesEmitido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cheques_emitido }
  end

  def new
    @cheques_emitido = ChequesEmitido.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cheques_emitido}
  end

  def edit
    @cheques_emitido= ChequesEmitido.find(params[:id])
  end

  def create
    @cheques_emitido = ChequesEmitido.new(cheques_emitido_params)
    respond_to do |format|
      if @cheques_emitido.save
        format.html { redirect_to @cheques_emitido, notice: 'cheques_emitido was successfully created.' }
        format.json { render :show, status: :created, location: @cheques_emitido }
      else
        format.html { render :new }
        format.json { render json: @cheques_emitido.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cheques_emitido.update(cheques_emitido_params)
        format.html { redirect_to @cheques_emitido, notice: 'cheques_emitido was successfully updated.' }
        format.json { render :show, status: :ok, location: @cheques_emitido }
      else
        format.html { render :edit }
        format.json { render json: @cheques_emitido.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cheques_emitido.destroy
    respond_to do |format|
      format.html { redirect_to @cheques_emitido, notice: 'cheques_emitido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cheques_emitido
      @cheques_emitido = ChequesEmitido.find(params[:id])
    end

    def cheques_emitido_params
      params.require(:cheques_emitido).permit(:id_cuenta_bancaria, :id_banco, :fecha, :concepto, :monto)
    end
=begin
   def render_cheques_emitido_list(cheques_emitido)
     report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'cheques_emitidos', 'show.tlf')
   
      cheques_emitido.each do |task|
       report.list.add_row do |row|
          row.values no: task.id, 
                     name: task.nombre_banco
          row.item(:name).style(:color, 'red')
        end
      end
      
      send_data report.generate, filename: 'cheques emitidos.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end 
=end
end
