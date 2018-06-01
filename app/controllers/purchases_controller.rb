class PurchasesController < ApplicationController

  before_action :set_purchase, only: [:edit, :update, :show, :destroy]
    before_action :require_user,except:[:index,:show]
    before_action :require_same_user,only:[:edit,:update,:destroy]

    #Ocupar para todos
    before_action :set_user, only: [:edit,:update,:show,:new]

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

        @user = User.find(current_user)
        #cuando se compren o se gasten baros  [update]:
       #poner esto al principio del update
     @baro_old = @user.cant_baros #cantidad antigua de baros


#-------------------------------------------------------------------------------


can_b = @us.cant_baros-purchase_params[:total].to_f
        @us.update_attribute(:cant_baros, @us.cant_baros-purchase_params[:total].to_f)


        #-------------------------------------------------------------------------------
        #poner esto hasta el final del update
        folder_path = "/home/marisol/adminredes/el_baro/Usuarios/" +  @user.usuario #ruta de la carpeta del usuario.
        Dir.glob(folder_path + "/" +@baro_old.to_s).sort.each do |f|
        filename = File.basename(f, File.extname(f))
        File.rename(f, folder_path + "/" +cbt.to_s+ File.extname(f)) #reemplaza el nombre archivo
      end





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

    #Ocupar para todos
      def set_user
        @user = User.find(current_user)
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
