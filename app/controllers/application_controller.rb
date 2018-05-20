class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Todos los metodos que esten aqui, son funcionales para todos los controllers
#Pero en views no son aceptables, para eso ponemos la linea de codigo de abajo
helper_method :current_user, :logged_in?


#Parametro para saber que usuario se ha logeado en la session
      def current_user

             @current_user ||= User.find(session[:user_id]) if session[:user_id]

      end
#Si esta logeado
      def logged_in?
          !!current_user
      end
#Tiene que estar logeado
   def require_user
      if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
      end
   end

end
