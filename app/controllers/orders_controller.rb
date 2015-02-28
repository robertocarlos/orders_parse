class OrdersController < ApplicationController
  include OrdersHelper
  
  def index
    order_by = permitted_params[:order_by] || :id
    @sorting = permitted_params[:sorting] || :asc 
    @orders  = Order.all.order(order_by => @sorting)
    @total   = @orders.sum(:total_price)
  end
  
  def new
  end
  
  def create
    parse(permitted_params[:uploaded_file])

    redirect_to orders_path
  end
  
  private
  
    def permitted_params
      params.permit(:uploaded_file, :order_by, :sorting)
    end
end
