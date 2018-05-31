class PurchasesController < ApplicationController

  before_action :set_purchase, only: [:edit, :update, :show, :destroy]
    before_action :require_user,except:[:index,:show]
    before_action :require_same_user,only:[:edit,:update,:destroy]

    def index
      @purchase = Purchase.all
    end

    def new
      @purchase = Purchase.new
    end

    def edit
    end

    def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user

    @us = User.find(current_user)

    if purchase_params[:total].to_f <= @us.cant_baros

      if @purchase.save
        flash[:success] = "COMPRA COMPLETADA!!"


        @us.update_attribute(:cant_baros, @us.cant_baros-purchase_params[:total].to_f)
        redirect_to purchase_path(@purchase)
      else
        render 'new'
      end
    else
      flash[:danger] = "No cuentas con los baros suficientes"
        render 'new'

    end
    end



    def update
      @purchase.user = current_user
      if @purchase.update(purchase_params)
        flash[:success] = "Article was successfully updated"
        redirect_to purchase_path(@purchase)
      else
        render 'edit'
      end
    end

    def show
    end

    private
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:total,:user_id,service_ids:[])
    end

    def require_same_user
      if current_user!= @purchase.user and @user.usuario != 'administrador'
        flash[:danger] = 'You can only edit or delete your own articles'
        redirect_to root_path
      end
    end

end
