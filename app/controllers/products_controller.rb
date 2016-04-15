class ProductsController < ApplicationController
  #def one_product
 # @first_line = Product.first    
 # end
  def index
  @all_products = Product.all 
 end
 
 def show
 @find_product = Product.find_by(id: params[:id]) 
  end
end
