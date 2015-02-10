class TiposDeEstado < ActiveRecord::Base
	has_many :Cajas

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

	def name_with_initial
		"#{descripcion}"
	end

end
