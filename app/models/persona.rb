class Persona < ActiveRecord::Base
	has_many :Cajas
	has_many :CuentasCorrientesVentum
	has_many :BoletasDeDepositos
	belongs_to :TiposDePersona	

	# Validaciones

	validates :id_tipo_de_persona,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :nombre,
		:presence => {
			message: 'este campo es requerido'},

		:length => { 
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'},

		:format => {
			with: /\A[a-zA-Z]+\z/,
			message: 'solo permite letras'}

	validates :direccion,
		:presence => {
			message: 'este campo es requerido'},

		:length => { 
			:maximum => 50,
			:too_long => 'debe tener como maximo %{count} caracteres'},

		:format => {
			with: /\A[A-Za-z0-9]+\z/,
			message: 'No se permite caracteres de puntuacion'}

	validates :localidad,
		:presence => {
			message: 'este campo es requerido'},

		:length => { 
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'},

		:format => {
			with: /\A[a-zA-Z]+\z/,
			message: 'solo permite letras'}

	validates :departamento,
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

		:uniqueness => true,

		:length => { 
			:maximum => 10,
			:too_long => 'debe tener como maximo %{count} caracteres'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	def name_with_initial
		"#{nombre}"
	end

end