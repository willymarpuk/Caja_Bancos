class DetallesBoletaDeDeposito < ActiveRecord::Base
	belongs_to :BoletaDeDeposito
	belongs_to :ChequesEntrante
end