class ServicesController < ApplicationController

  before_action :require_same_user, only: [:edit, :destroy]

  #Ocupar para todos
  before_action :set_user, only: [:edit,:update,:show,:new]


   def index
      @service = Service.all
    end

    def show
      @service = Service.find(params[:id])
      @service_purchase= @service.purchases.all
    end

    def edit
      @category = Category.find(params[:id])
    end



  private
  def category_params
    params.require(:service).permit(:nombre)
  end


  #Ocupar para todos
    def set_user
      @user = User.find(current_user)
    end

    def require_same_user

      if current_user != @ctransaction.user and @user.usuario != 'administrador'
        fash[:danger] = "Solo puedes editar tu cuenta"
        redirect_to user_path(@user)
      end

    end



end
