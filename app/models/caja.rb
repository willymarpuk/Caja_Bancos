class Caja < ActiveRecord::Base
	has_many :BoletasDeDeposito
	has_many :MovimientosDeCajas
	has_many :CuentasCorrientesVentas
	has_many :DetallesCajas
	belongs_to :Persona
	belongs_to :TiposDeEstado
end