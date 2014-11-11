class Banco < ActiveRecord::Base
	has_many :BoletasDeDepositos
	has_many :ChequesEntrantes
	has_many :CuentasBancarias
	has_many :ChequesEmitidos
	has_many :MovimientosDeBancos


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
end
