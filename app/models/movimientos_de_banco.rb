class MovimientosDeBanco < ActiveRecord::Base
	belongs_to :Banco
	belongs_to :TiposDeMovimiento
end
