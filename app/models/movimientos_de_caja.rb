class MovimientosDeCaja < ActiveRecord::Base
	has_many :CuentasCorrientesVentas
	belongs_to :ChequesEntrante
	belongs_to :TiposDeMovimiento
	belongs_to :Caja
	belongs_to :ChequesEmitido
end
