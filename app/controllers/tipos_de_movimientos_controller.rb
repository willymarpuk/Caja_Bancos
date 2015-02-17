class TiposDeMovimientosController < ApplicationController
  before_action :set_tipos_de_movimiento, only: [:show, :edit, :update, :destroy]

  def index
    @tipos_de_movimientos = TiposDeMovimiento.all
    @tipos_de_movimiento = TiposDeMovimiento.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipos_de_movimientos }
      format.xls { send_data @tipos_de_movimientos.to_xls(
        :columns => [:created_at, :descripcion, :tipo, :updated_at],
        :headers => ["Fecha Creada", "tipos de movimientos","tipo", "Fecha actualizacion"] ),
        :filename => 'tipos_de_movimientos.xls' }
      format.pdf { render_tipos_de_movimientos_list(@tipos_de_movimientos) }
    end
  end

  def show
    @tipos_de_movimiento = TiposDeMovimiento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipos_de_movimiento }
    end
  end

  def new
    @tipos_de_movimiento = TiposDeMovimiento.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipos_de_movimiento }
    end
  end

  def edit
     @tipos_de_movimiento = TiposDeMovimiento.find(params[:id])
  end

  def create
    @tipos_de_movimiento = TiposDeMovimiento.new(tipos_de_movimiento_params)
    respond_to do |format|
      if @tipos_de_movimiento.save
        format.html { redirect_to tipos_de_movimientos_url, notice: 'el tipo de movimiento fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipos_de_movimiento }
      else
        format.html { render :new }
        format.json { render json: @tipos_de_movimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
     respond_to do |format|
      if @tipos_de_movimiento.update(tipos_de_movimiento_params)
        format.html { redirect_to @tipos_de_movimiento, notice: 'el tipo de movimiento fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipos_de_movimiento }
      else
        format.html { render :edit }
        format.json { render json: @tipos_de_movimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tipos_de_movimiento.destroy
    respond_to do |format|
      format.html { redirect_to @tipos_de_movimiento, notice: 'el tipo de movimiento fue destruido exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tipos_de_movimiento
      @tipos_de_movimiento = TiposDeMovimiento.find(params[:id])
    end

    def tipos_de_movimiento_params
      params.require(:tipos_de_movimiento).permit(:descripcion, :tipo)
    end

  def render_tipos_de_movimientos_list(tipos_de_movimiento)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'tipos_de_movimientos', 'show.tlf')

      tipos_de_movimiento.each do |task|
        report.list.add_row do |row|
          row.values no: task.id, 
                     tipo: task.tipo,
                     descripcion: task.descripcion
          row.item(:tipo).style(:color, 'red')
          row.item(:descripcion).style(:color, 'red')
        end
      end
      
      send_data report.generate, filename: 'tipos de movimientos.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
