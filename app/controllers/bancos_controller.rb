class BancosController < ApplicationController
  before_action :set_banco, only: [:show, :edit, :update, :destroy]

  # GET /bancos
  # GET /bancos.json
  
  def index
    @bancos = Banco.all
    @banco = Banco.new
     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bancos }
      format.xls { send_data @bancos.to_xls(
        :columns => [:nombre_banco],
        :headers => ["Banco" ] ),
        :filename => 'bancos.xls' }
      format.pdf { render_banco_list(@bancos) }
    end
  end

  
  # GET /bancos/1
  # GET /bancos/1.json
  def show
    @banco = Banco.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @banco }
    end
  end
  # GET /bancos/new
  # GET /bancos/new.json
  def new
    @banco = Banco.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @banco }
    end
  end
# GET /bancos/1/edit
  def edit
    @banco= Banco.find(params[:id])
  end
  # POST /bancos
  # POST /bancos.json
  def create
    @banco = Banco.new(banco_params)

    respond_to do |format|
      if @banco.save
        format.html { redirect_to @banco, notice: 'el banco fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @banco }
      else
        format.html { render :new }
        format.json { render json: @banco.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /bancos/1
  # PATCH/PUT /bancos/1.json
  def update
    respond_to do |format|
      if @banco.update(banco_params)
        format.html { redirect_to @banco, notice: 'el banco fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @banco }
      else
        format.html { render :edit }
        format.json { render json: @banco.errors, status: :unprocessable_entity }
      end
    end
  end
 # DELETE /bancos/1
 # DELETE /bancos/1.json
  def destroy
    @banco.destroy
    respond_to do |format|
      format.html { redirect_to @banco, notice: 'el banco fue destruido exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_banco
      @banco = Banco.find(params[:id])
    end

    def banco_params
      params.require(:banco).permit(:nombre_banco)
    end

  def render_banco_list(banco)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'bancos', 'show.tlf')

      banco.each do |task|
        report.list.add_row do |row|
          row.values no: task.id, 
                     name: task.nombre_banco,
                     sucursal: task.sucursal,
                     direccion: task.direccion,
                     telefono: task.telefono,
                     correo: task.correo
          row.item(:name).style(:color, 'red')
          row.item(:sucursal).style(:color, 'red')
          row.item(:direccion).style(:color, 'red')
          row.item(:telefono).style(:color, 'red')
          row.item(:correo).style(:color, 'red')
        end
      end
      
      send_data report.generate, filename: 'bancos.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
