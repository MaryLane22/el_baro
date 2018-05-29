class ServicesController < ApplicationController

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



end
