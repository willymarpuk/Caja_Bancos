class DetallesCaja < ActiveRecord::Base
	belongs_to :ChequesEntrante
	belongs_to :ChequesEmitidos
	belongs_to :Caja
end