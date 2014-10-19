class Persona < ActiveRecord::Base
	has_many :Cajas
	has_many :CuentasCorrientesVentas
	has_many :BoletasDeDepositos
	belongs_to :TiposDePersona	
end