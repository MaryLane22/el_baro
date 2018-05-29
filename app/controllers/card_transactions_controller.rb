class CardTransactionsController < ApplicationController
  before_action :set_ctransaction, only: [:edit, :destroy, :show]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :destroy]

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
       if @ctransaction.save
           flash[:success] = "Compra de baros exitosa!"

           #Registro de baros
           @user = User.find(current_user)
           tipo_cambio=10
           #@ctlast = CardTransaction.last
           c_baros = ctransaction_params[:monto].to_f / tipo_cambio
           cbt = 0.0@otransaction=OxxoTransaction.new
           cbt = c_baros + @user.cant_baros.to_f
           #Aumentar la cantidad de baros al usuario
           @user.update_attribute(:cant_baros, cbt)
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


  def ctransaction_params
      params.require(:card_transaction).permit(:nombre_propietario,:nombre_banco,:numero_tarjeta,:fecha_vencimiento,
      :codigo,:monto,:total)
  end


  def require_same_user

    if current_user != @ctransaction.user and @user.usuario != 'administrador'
      fash[:danger] = "Solo puedes editar tu cuenta"
      redirect_to user_path(@user)
    end

  end



end
