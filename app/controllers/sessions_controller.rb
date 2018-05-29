class SessionsController < ApplicationController
  def new
    @user = User.new
  end



  def create
    user = User.find_by(usuario: params[:session][:usuario].downcase)

    if user and user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Has entrado exitosamente!"
      redirect_to user_path(user)
    else
#Le quite flash.now
      flash[:danger] = "Hubo un problema con tu informacion"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Has salido"
    redirect_to root_path
  end


end
