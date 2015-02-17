class ChequesEntrantesController < ApplicationController
  before_action :set_cheques_entrante, only: [:show, :edit, :update, :destroy]

  def index
    @cheques_entrantes = ChequesEntrante.all
    @cheques_entrante = ChequesEntrante.new
    @banco = Banco.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cheques_entrantes }
      format.xls { send_data @cheques_entrantes.to_xls(
      :columns => [:id_banco, :numero, :monto, :concepto],
      :headers => ["Banco", "Numero", "Monto", "Concepto"] ),
      :filename => 'cheques_entrantes.xls' }
      format.pdf { render_cheques_entrante_list(@cheques_entrantes) }
    end
  end

  def show
    @cheques_entrante = ChequesEntrante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cheques_entrante }
    end
  end

  def new
    @cheques_entrante = ChequesEntrante.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cheques_entrante }
    end
  end

  def edit
    @cheques_entrante= ChequesEntrante.find(params[:id])
  end

  def create
    @cheques_entrante = ChequesEntrante.new(cheques_entrante_params)

    respond_to do |format|
      if @cheques_entrante.save
        format.html { redirect_to cheques_entrantes_url, notice: 'el cheque entrante fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @cheques_entrante }
      else
        format.html { render :new }
        format.json { render json: @cheques_entrante.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cheques_entrante.update(cheques_entrante_params)
        format.html { redirect_to @cheques_entrante, notice: 'el cheque entrante fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @cheques_entrante }
      else
        format.html { render :edit }
        format.json { render json: @cheques_entrante.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cheques_entrante.destroy
    respond_to do |format|
      format.html { redirect_to @cheques_entrante, notice: 'el cheque entrante fue destruido exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cheques_entrante
      @cheques_entrante = ChequesEntrante.find(params[:id])
    end

    def cheques_entrante_params
      params.require(:cheques_entrante).permit(:id_banco, :numero, :monto, :concepto)
    end

 def render_cheques_entrante_list(cheques_entrante)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'cheques_entrantes', 'show.tlf')

      cheques_entrante.each do |task|
        report.list.add_row do |row|
          row.values banco: task.id_banco,
                     numero: task.numero,
                     monto: task.monto,
                     concepto: task.concepto
          row.item(:banco).style(:color, 'red')
          row.item(:numero).style(:color, 'red')
          row.item(:monto).style(:color, 'red')
          row.item(:concepto).style(:color, 'red')
        end
      end

      send_data report.generate, filename: 'cheques entrantes.pdf',
                                 type: 'application/pdf',
                                 disposition: 'attachment'
    end
end
