class UsersController < ApplicationController

  #Parametros reutilizables
  before_action :set_user, only: [:edit,:update,:show]
  before_action :require_same_user, only: [:edit,:update,:show]
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success]="Bienvenido a el B A R O #{@user.usuario}"

      #cuando se registre un nuevo usuario [create]:
directory_name = "Usuarios/" + @user.usuario
Dir.mkdir(directory_name) unless File.exists?(directory_name) #Crear el directorio donde se ubica el archivo del baro del usuario.
FileUtils.touch('Usuarios/' + @user.usuario+'/0')  #Crear baro inicial.



      redirect_to root_path
      #redirect_to user_path(@user)
    else
    redirect_to login_path

    end

  end

  def edit

  end

def update
  if @user.update(user_params)
    flash[:success] = "Usuario actualizado"
    redirect_to user_path(@user)
  else
    render 'edit'
  end

end


def show
   #@user_services = @user.services
   @user = User.find(current_user)
end

def all
  @use = User.find(current_user)
  @users_oxxo_transactions = @use.oxxo_transactions.all
  #Para pagos con tarjeta
  @users_card_transactions = @use.card_transactions.all
end

def processar
  @users_oxxo_transactions = @user.oxxo_transactions.all
end


private
def user_params
  params.require(:user).permit(:nocontrol,:nombre,:usuario,:password, :carrera, :semestre, :cant_baros)
end

def set_user
  @user = User.find(params[:id])
end

def require_same_user
  if current_user != @user and @user.usuario != 'administrador'
    fash[:danger] = "Solo puedes editar tu cuenta"
    redirect_to user_path(@user)
  end
end

def get_actualbaros
  @user = User.find(current_user)
  return (@user.cant_baros)
end


end
