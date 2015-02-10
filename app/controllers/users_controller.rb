class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @user = User.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
      format.xls { send_data @users.to_xls(
        :columns => [:username, :email, :sign_in_count, :last_sign_in_at, :created_at, :updated_at],
        :headers => ["Nombre de usuario", "email", "cantidad de conexiones al sistema", "ultima vez conectado", "creacion del perfil", "modificacion del perfil"] ),
        :filename => 'Usuarios.xls' }
      format.pdf { render_user_list(@users) }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
     @user = User.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username,:email, :password, :password_confirmation)
    end


    def render_user_list(user)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'users', 'show.tlf')

      user.each do |task|
        report.list.add_row do |row|
          row.values name: task.username,
                     email: task.email,
                     conexiones_al_sistema: task.sign_in_count,
                     ultima_vez_conectado: task.last_sign_in_at,
                     creacion_del_perfil: task.created_at,
                     modificacion_del_perfil: task.updated_at
          row.item(:name).style(:color, 'red')
          row.item(:email).style(:color, 'red')
          row.item(:conexiones_al_sistema).style(:color, 'red')
          row.item(:ultima_vez_conectado).style(:color, 'red')
          row.item(:creacion_del_perfil).style(:color, 'red')
          row.item(:modificacion_del_perfil).style(:color, 'red')
        end
      end
      
      send_data report.generate, filename: 'usuarios.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end