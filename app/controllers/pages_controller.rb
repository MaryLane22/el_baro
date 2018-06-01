class PagesController < ApplicationController
  #Parametros reutilizables
  before_action :set_user, only: [:edit,:update,:show]
  before_action :require_same_user, only: [:edit,:update,:show]
  def home
  end

  def show

  end
end


private
def set_user
  @user =  User.find(current_user)
end

def require_same_user
  if current_user != @user and @user.usuario != 'administrador'
    fash[:danger] = "Solo puedes editar tu cuenta"
    redirect_to user_path(@user)
  end
end
