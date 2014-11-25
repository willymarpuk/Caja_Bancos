class FirmantesController < ApplicationController
  before_action :set_firmante, only: [:show, :edit, :update, :destroy]

  def index
    @firmantes = Firmante.all
    respond_with(@firmantes)
  end

  def show
    respond_with(@firmante)
  end

  def new
    @firmante = Firmante.new
    respond_with(@firmante)
  end

  def edit
  end

  def create
    @firmante = Firmante.new(firmante_params)
    @firmante.save
    respond_with(@firmante)
  end

  def update
    @firmante.update(firmante_params)
    respond_with(@firmante)
  end

  def destroy
    @firmante.destroy
    respond_with(@firmante)
  end

  private
    def set_firmante
      @firmante = Firmante.find(params[:id])
    end

    def firmante_params
      params.require(:firmante).permit(:nombre)
    end
end
