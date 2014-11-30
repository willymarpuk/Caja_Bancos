class Banco < ActiveRecord::Base
	has_many :BoletasDeDepositos
	has_many :ChequesEntrantes
	has_many :CuentasBancarium
	has_many :ChequesEmitidos
	has_many :MovimientosDeBancos


	# Validaciones
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :nombre_banco, 
		:presence => {
			message: 'este campo es requerido'},

		:length => { 
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'},

		:format => {
			with: /\A[a-zA-Z]+\z/,
			message: 'solo permite letras'}

	validates :telefono,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :direccion,
		:presence => {
			message: 'este campo es requerido'},

		:length => { 
			:maximum => 50,
			:too_long => 'debe tener como maximo %{count} caracteres'},

		:format => {
			with: /\A[A-Za-z0-9]+\z/,
			message: 'No se permite caracteres de puntuacion'}

	validates :sucursal,
		:presence => {
			message: 'este campo es requerido'},

		:length => { 
			:maximum => 50,
			:too_long => 'debe tener como maximo %{count} caracteres'},

		:format => {
			with: /\A[A-Za-z0-9]+\z/,
			message: 'No se permite caracteres de puntuacion'}

	validates :correo, 
		:format => { 
			:with => VALID_EMAIL_REGEX,
			message: "El formato del correo es invalido" }

	def name_with_initial
		"#{nombre_banco}  #{sucursal}"
	end

end
