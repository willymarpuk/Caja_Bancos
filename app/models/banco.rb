class Banco < ActiveRecord::Base
	has_many :BoletasDeDepositos
	has_many :ChequesEntrantes
	has_many :CuentasBancarias
	has_many :ChequesEmitidos
	has_many :MovimientosDeBancos

<<<<<<< HEAD
	include ActiveModel::Validations
    validates_length_of :nombre_banco, :maximum => 10
=======

	# Validaciones

	validates :nombre_banco, 
		:presence => {
			message: 'este campo es requerido'},

		:length => { 
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'},

		:format => {
			with: /\A[a-zA-Z]+\z/,
			message: 'solo permite letras'}
>>>>>>> 29284e080e4ebf197f604b7d1fe64b26eb886093
end
