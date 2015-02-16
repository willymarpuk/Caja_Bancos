class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]

  def index
    @personas = Persona.all
    @persona = Persona.new
    @tipos_de_persona = TiposDePersona.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personas }
      format.xls { send_data @personas.to_xls(
        :columns => [:created_at, :id_tipo_de_persona, :nombre, :direccion, :localidad, :departamento, :telefono, :updated_at],
        :headers => ["Fecha Creada", "tipos de persona","nombre", "direccion", "localidad", "departamento", "telefono", "Fecha actualizacion"] ),
        :filename => 'personas.xls' }
      format.pdf { render_personas_list(@personas) }
    end
  end

  def show
    @persona = Persona.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @persona }
    end
  end

  def new
    @persona = Persona.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @persona }
    end
  end

  def edit
    @persona = Persona.find(params[:id])
  end

  def create
    @persona = Persona.new(persona_params)
    respond_to do |format|
      if @persona.save
        format.html { redirect_to @persona, notice: 'la persona fue creada exitosamente.' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
     respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: 'la persona fue actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to @persona, notice: 'la persona fue destruida exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_persona
      @persona = Persona.find(params[:id])
    end

    def persona_params
      params.require(:persona).permit(:id_tipo_de_persona, :nombre, :direccion, :localidad, :departamento, :telefono)
    end

def render_personas_list(persona)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'personas', 'show.tlf')

      persona.each do |task|
        report.list.add_row do |row|
          row.values nombre: task.nombre, 
                     tipo_de_persona: task.id_tipo_de_persona,
                     direccion: task.direccion,
                     localidad: task.localidad,
                     departamento: task.departamento,
                     telefono: task.telefono
          row.item(:nombre).style(:color, 'red')
          row.item(:tipo_de_persona).style(:color, 'red')
          row.item(:direccion).style(:color, 'red')
          row.item(:localidad).style(:color, 'red')
          row.item(:departamento).style(:color, 'red')
          row.item(:telefono).style(:color, 'red')
        end
      end
      
      send_data report.generate, filename: 'personas.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
