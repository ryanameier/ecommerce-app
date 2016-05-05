class CartedProductsController < ApplicationController

  def index
      @order = current_user.orders.find_by(completed: false)
      # @carted_products = order.carted_products
  end

  def create
    order = (current_user.orders.find_by(completed: false) || Order.create(completed: false, user_id: current_user.id))
    carted_product = CartedProduct.new(product_id: params[:product_id], quantity: params[:quantity], order_id: order.id)
    carted_product.save
    redirect_to "/carted_products"
  end

  def destroy
    CartedProduct.find_by(id: params[:id]).destroy
    
    redirect_to "/carted_products"
  end

end