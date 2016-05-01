class OrdersController < ApplicationController

def create
product = Product.find_by(id: params[:product_id]) #looks at all variables id, user_id,total, tax etc
subtotal = product.price * params[:quantity].to_i
tax = subtotal * subtax
total = subtotal + subtax

  new_order = Order.new(quantity: params[:quantity], user_id: current_user.id, product_id: params[:product_id], subtotal: subtotal, tax: tax, total: total)
  new_order.save
  redirect_to "/orders/#{new_order.id}" #calls order.id of current instance that was created in the database (sql/postico) allowing a display of current order
end


  def show
 @find_order = current_user.orders.find_by(id: params[:id]) 
 end
end