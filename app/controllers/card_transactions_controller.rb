class CardTransactionsController < ApplicationController
  require 'fileutils'
  before_action :set_ctransaction, only: [:edit, :destroy, :show]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :destroy]

  #Ocupar para todos
  before_action :set_user, only: [:edit,:update,:show,:new]

  def index
      #Este cargara un numero de items o articulos por pagina y podemos decirle cuantos por pagina
      #Para que se vea, en el index de articulos agregamos algunas lineas de codigo
      @ctransaction=CardTransaction.all
      #@articles=Article.paginate(page: params[:page], per_page: 5)
  end

  def new
      @ctransaction=CardTransaction.new
  end

  def edit
  end



  def create
      #render plain: params[:article].inspect

       @ctransaction=CardTransaction.new(ctransaction_params)
       @ctransaction.user = current_user

       @user = User.find(current_user)

       #cuando se compren o se gasten baros  [update]:
      #poner esto al principio del update
    @baro_old = @user.cant_baros #cantidad antigua de baros


       if @ctransaction.save
           flash[:success] = "Compra de baros exitosa!"


#-------------------------------------------------------------------------------

           #Registro de baros

           tipo_cambio=10
           #@ctlast = CardTransaction.last
           c_baros = ctransaction_params[:monto].to_f / tipo_cambio
           cbt = 0.0
           cbt = c_baros + @user.cant_baros.to_f
           #Aumentar la cantidad de baros al usuario
           @user.update_attribute(:cant_baros, cbt)

           x = cbt.to_s.split('')
           @y = x[0]+x[1]


#-------------------------------------------------------------------------------
#poner esto hasta el final del update
folder_path = "/home/marisol/adminredes/el_baro/Usuarios/" +  @user.usuario #ruta de la carpeta del usuario.

Dir.glob(folder_path + "/" + @baro_old.to_s).sort.each do |f|
filename = File.basename(f, File.extname(f))
File.rename(f, folder_path + "/" + @y.to_s + File.extname(f)) #reemplaza el nombre archivo
end



           redirect_to card_transaction_path(@ctransaction)
       else
           render 'new'
       end
  end


  def show

  end

  # ------------------------ OPCIONAL ------------------------
  def destroy

      @ctransaction.destroy
      flash[:danger]="La transaccion fue eliminada"
      redirect_to cardtransactions_path
  end

  #------------------------------------------- PRIVATE ---------------

  private

  def set_ctransaction
       @ctransaction = CardTransaction.find(params[:id])
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



  def ctransaction_params
      params.require(:card_transaction).permit(:nombre_propietario,:numero_tarjeta,:fecha_vencimiento,
      :codigo,:monto,:total)
  end






end
