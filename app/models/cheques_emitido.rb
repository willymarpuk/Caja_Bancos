class ChequesEmitido < ActiveRecord::Base
	has_many :MovimientosDeCajas
	has_many :DetallesCajas
	belongs_to :CuentasBancarium
	belongs_to :Banco

	# Validaciones

	validates :id_cuenta_bancaria,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :id_banco,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :monto,
		:presence => {
			message: 'este campo es requerido'}#,

		#:format => {
		#	with: /\A[0-9]+\z/,
		#	message: 'solo permite numeros'}

	validates :fecha,
		:presence => {
			message: 'este campo es requerido'}

	validates :concepto,
		:presence => {
			message: 'este campo es requerido'},

		:length => { 
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'}#,

		#:format => {
		#	with: /\A[a-zA-Z]+\z/,
		#	message: 'solo permite letras'}


  def name_with_initial
	"#{nro_cuenta}"
  end
end
