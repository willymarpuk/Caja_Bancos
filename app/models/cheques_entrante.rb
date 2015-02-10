class ChequesEntrante < ActiveRecord::Base
	has_many :DetallesBoletaDeDepositos
	has_many :detallesCajas
	has_many :MovimientosDeCajas
	belongs_to :Banco

	# Validaciones

	validates :id_banco,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :numero,
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
	"#{numero}"
  end
end
