class BancosController < ApplicationController
  before_action :set_banco, only: [:show, :edit, :update, :destroy]

  def index
    @bancos = Banco.all
    @banco = Banco.new
  end

  def show
  end

  def new
    @banco = Banco.new
  end

  def edit
  end

  def create
    @banco = Banco.new(banco_params)
    @banco.save
  end

  def update
    @banco.update(banco_params)
  end

  def destroy
    @banco.destroy
  end

  private
    def set_banco
      @banco = Banco.find(params[:id])
    end

    def banco_params
      params.require(:banco).permit(:nombre_banco)
    end
end
