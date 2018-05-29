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
      redirect_to root_path
      #redirect_to user_path(@user)
    else
      render 'show'

      #render 'new'
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

end
