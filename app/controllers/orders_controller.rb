class OrdersController < ApplicationController

 def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    total_tax = product.tax * quantity
    subtotal = product.price * quantity
    total = total_tax + subtotal

    order = Order.new(product_id: product.id, user_id: current_user.id, quantity: quantity, tax: total_tax, subtotal: subtotal, total: total)
    order.save
    redirect_to "/orders/#{order.id}" #calls order.id of current instance that was created in the database (sql/postico) allowing a display of current order
end

def show  
    @order = current_user.orders.find_by(id: params[:id])
  end

  def update
    order = Order.find_by(id: params[:id])
    total_tax = 0
    total_subtotal = 0
    order.carted_products.each do |carted_product|
      total_tax += (carted_product.product.tax.to_i * carted_product.quantity.to_i)
      total_subtotal += (carted_product.product.price * carted_product.quantity)
    end
    total = total_tax + total_subtotal
    order.update(completed: true, tax: total_tax, subtotal: total_subtotal, total: total)
    redirect_to "/orders/#{order.id}"
  end

end