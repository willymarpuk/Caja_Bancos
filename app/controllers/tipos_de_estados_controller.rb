class TiposDeEstadosController < ApplicationController
  before_action :set_tipos_de_estado, only: [:show, :edit, :update, :destroy]

  def index
    @tipos_de_estados = TiposDeEstado.all
    @tipos_de_estado = TiposDeEstado.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipos_de_estados }
      format.xls { send_data @tipos_de_estados.to_xls(
        :columns => [:created_at, :descripcion, :updated_at],
        :headers => ["Fecha Creada", "tipos de estados", "Fecha actualizacion"] ),
        :filename => 'tipos_de_estados.xls' }
      format.pdf { render_tipos_de_estados_list(@tipos_de_estados) }
    end
  end

  def show
    @tipos_de_estado = TiposDeEstado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipos_de_estado }
    end
  end

  def new
    @tipos_de_estado = TiposDeEstado.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipos_de_estado }
    end
  end

  def edit
    @tipos_de_estado = TiposDeEstado.find(params[:id])
  end

  def create
    @tipos_de_estado = TiposDeEstado.new(tipos_de_estado_params)
    respond_to do |format|
      if @tipos_de_estado.save
        format.html { redirect_to @tipos_de_estado, notice: 'tipos_de_estado was successfully created.' }
        format.json { render :show, status: :created, location: @tipos_de_estado }
      else
        format.html { render :new }
        format.json { render json: @tipos_de_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tipos_de_estado.update(tipos_de_estado_params)
        format.html { redirect_to @tipos_de_estado, notice: 'tipos_de_estado was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipos_de_estado }
      else
        format.html { render :edit }
        format.json { render json: @tipos_de_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tipos_de_estado.destroy
    respond_to do |format|
      format.html { redirect_to @tipos_de_estado, notice: 'tipos_de_estado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tipos_de_estado
      @tipos_de_estado = TiposDeEstado.find(params[:id])
    end

    def tipos_de_estado_params
      params.require(:tipos_de_estado).permit(:descripcion)
    end

def render_tipos_de_estados_list(tipos_de_estado)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'tipos_de_estados', 'show.tlf')

      tipos_de_estado.each do |task|
        report.list.add_row do |row|
          row.values no: task.id, 
                     descripcion: task.descripcion
          row.item(:descripcion).style(:color, 'red')
        end
      end
      
      send_data report.generate, filename: 'tipos de estados.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
