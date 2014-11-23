class TiposDePersonasController < ApplicationController
  before_action :set_tipos_de_persona, only: [:show, :edit, :update, :destroy]

  def index
    @tipos_de_personas = TiposDePersona.all
    @tipos_de_persona = TiposDePersona.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipos_de_personas }
      format.xls { send_data @tipos_de_personas.to_xls(
        :columns => [:created_at, :descripcion, :updated_at],
        :headers => ["Fecha Creada", "tipos de personas", "Fecha actualizacion"] ), 
        :filename => 'tipos_de_personas.xls' }
      format.pdf { render_tipos_de_personas_list(@tipos_de_personas) }
    end
  end

  def show
    @tipos_de_persona = TiposDePersona.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipos_de_persona }
    end
  end

  def new
    @tipos_de_persona = TiposDePersona.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipos_de_persona }
    end
  end

  def edit
    @tipos_de_persona = TiposDePersona.find(params[:id])
  end

  def create
    @tipos_de_persona = TiposDePersona.new(tipos_de_persona_params)
    respond_to do |format|
      if @tipos_de_persona.save
        format.html { redirect_to @tipos_de_persona, notice: 'tipos_de_persona was successfully created.' }
        format.json { render :show, status: :created, location: @tipos_de_persona }
      else
        format.html { render :new }
        format.json { render json: @tipos_de_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tipos_de_persona.update(tipos_de_persona_params)
        format.html { redirect_to @tipos_de_persona, notice: 'tipos_de_persona was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipos_de_persona }
      else
        format.html { render :edit }
        format.json { render json: @tipos_de_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tipos_de_persona.destroy
    respond_to do |format|
      format.html { redirect_to @tipos_de_persona, notice: 'tipos_de_persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tipos_de_persona
      @tipos_de_persona = TiposDePersona.find(params[:id])
    end

    def tipos_de_persona_params
      params.require(:tipos_de_persona).permit(:descripcion)
    end

  def render_tipos_de_personas_list(tipos_de_persona)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'tipos_de_personas', 'show.tlf')

      tipos_de_persona.each do |task|
        report.list.add_row do |row|
          row.values no: task.id, 
                     descripcion: task.descripcion
          row.item(:descripcion).style(:color, 'red')
        end
      end
      
      send_data report.generate, filename: 'tipos de personas.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
