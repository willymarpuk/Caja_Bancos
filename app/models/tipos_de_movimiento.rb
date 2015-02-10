class TiposDeMovimiento < ActiveRecord::Base
	has_many :MovimientosDeCajas
	has_many :MovimientosDeBancos

	# Validaciones 

		validates :descripcion,
			:presence => {
				message: 'este campo es requerido'},

			:length => { 
				:maximum => 20,
				:too_long => 'debe tener como maximo %{count} caracteres'}#,

			#:format => {
			#	with: /\A[a-zA-Z]+\z/,
			#	message: 'solo permite letras'}

		validates :tipo, 
			:presence => {
				message: 'este campo es requerido'},

			:format => {
				with: /\A[0-9]+\z/,
				message: 'solo permite numeros'}
	def name_with_initial
		"#{descripcion} #{tipo}"
	end

end