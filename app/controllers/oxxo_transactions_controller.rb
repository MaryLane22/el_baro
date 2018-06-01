class OxxoTransactionsController < ApplicationController
  before_action :set_otransaction, only: [:edit, :destroy, :show, :update]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  #Ocupar para todos
  before_action :set_user, only: [:edit,:update,:show,:new]


  def index
      #Este cargara un numero de items o articulos por pagina y podemos decirle cuantos por pagina
      #Para que se vea, en el index de articulos agregamos algunas lineas de codigo
      @otransaction=OxxoTransaction.all
      #@articles=Article.paginate(page: params[:page], per_page: 5)
  end


  def new
      @otransaction=OxxoTransaction.new
  end


  def edit
  end



  def create
      #render plain: params[:article].inspect
      @otransaction=OxxoTransaction.new(otransaction_params)
      @otransaction.status = 0
      @otransaction.user = current_user

       if @otransaction.save
           flash[:success] = "Proceso iniciado! Una vez pagado regresa a ingresar tu codigo"

            redirect_to oxxo_transaction_path(@otransaction)

       else
           render 'new'
       end
  end


  def update

    @user = User.find(current_user)
    #cuando se compren o se gasten baros  [update]:
   #poner esto al principio del update
 @baro_old = @user.cant_baros #cantidad antigua de baros


#-------------------------------------------------------------------------------


      #Si se actualizo la iformacion que se mando en SUBMIT

      @otransaction.update_attribute(:status, 1)
      if @otransaction.update(otransaction2_params)
          flash[:success] = "Compra de baros exitosa"

        #Registro de baros

            tipo_cambio=10

            #@ctlast = CardTransaction.last
            @lct = OxxoTransaction.last
            c_baros = @lct.monto.to_f / tipo_cambio
            cbt = 0.0

            cbt = c_baros + @user.cant_baros.to_f
            #Aumentar la cantidad de baros al usuario
            @user.update_attribute(:cant_baros, cbt)

            #-------------------------------------------------------------------------------
            #poner esto hasta el final del update
            folder_path = "/home/marisol/adminredes/el_baro/Usuarios/" +  @user.usuario #ruta de la carpeta del usuario.
            Dir.glob(folder_path + "/" + @baro_old.to_s).sort.each do |f|
            filename = File.basename(f, File.extname(f))
            File.rename(f, folder_path + "/" + cbt.to_s+ File.extname(f)) #reemplaza el nombre archivo


            redirect_to oxxo_transaction_path(@otransaction)
      else
          render 'edit'
      end
  end



  def show

  end

# ------------------------ OPCIONAL ------------------------
  def destroy

      @otransaction.destroy
      flash[:danger]="La transaccion fue eliminada"
      redirect_to cardtransactions_path
  end



  private

  def set_otransaction
       @otransaction = OxxoTransaction.find(params[:id])
  end

  #Ocupar para todos
    def set_user
      @user = User.find(current_user)
    end




  def otransaction2_params
      params.require(:oxxo_transaction).permit(:codigo_recibido)
  end


  def otransaction_params
      params.require(:oxxo_transaction).permit(:codigo_emitido, :monto, :total)
  end


  def require_same_user

    if current_user != @otransaction.user and @user.usuario != 'administrador'
      fash[:danger] = "Solo puedes editar tu cuenta"
      redirect_to user_path(@user)
    end


  end


end
