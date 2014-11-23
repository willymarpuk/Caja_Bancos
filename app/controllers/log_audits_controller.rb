class LogAuditsController < ApplicationController
  before_action :set_log_audit, only: [:show, :edit, :update, :destroy]

  def index
    @log_audits = LogAudit.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @log_audits }
      format.xls { send_data @log_audits.to_xls(
        :columns => [:nombre_tabla, :operacion, :valor_anterior, :valor_nuevo, :nombre_usuario ],
        :headers => ["Registro modificado", "Operacion", "Valor anterior", "Valor nuevo", "Nombre de usuario" ] ),
        :filename => 'log_de_auditoria.xls' }
       format.pdf { render_log_auditoria_list(@log_audits) }
    end
  end

  def show
    respond_with(@log_audit)
  end

  def new
    @log_audit = LogAudit.new
    respond_with(@log_audit)
  end

  def edit
  end

  def create
    @log_audit = LogAudit.new(log_audit_params)
    @log_audit.save
    respond_with(@log_audit)
  end

  def update
    @log_audit.update(log_audit_params)
    respond_with(@log_audit)
  end

  def destroy
    @log_audit.destroy
  end

  private
    def set_log_audit
      @log_audit = LogAudit.find(params[:id])
    end

    def log_audit_params
      params.require(:log_audit).permit(:nombre_tabla, :operacion, :valor_anterior, :valor_nuevo, :nombre_usuario)
    end

   def render_log_auditoria_list(log_audits)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'log_audits', 'show.tlf')

      log_audits.each do |task|
        report.list.add_row do |row|
          row.values tabla_modificada: task.nombre_tabla,
                     operacion: task.operacion,
                     valor_anterior: task.valor_anterior,
                     valor_nuevo: task.valor_nuevo,
                     nombre_usuario: task.nombre_usuario
          row.item(:tabla_modificada).style(:color, 'red')
          row.item(:operacion).style(:color, 'red')
          row.item(:valor_anterior).style(:color, 'red')
          row.item(:valor_nuevo).style(:color, 'red')
          row.item(:nombre_usuario).style(:color, 'red')
        end
      end
      
      send_data report.generate, filename: 'log_de_auditoria.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
