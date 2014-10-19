class TiposDeMovimiento < ActiveRecord::Base
	has_many :MovimientosDeCajas
	has_many :MovimientosDeBancos
end