class CuentasCorrientesVentum < ActiveRecord::Base
	belongs_to :Persona
	belongs_to :MovimientosDeCaja
	belongs_to :Caja
end
