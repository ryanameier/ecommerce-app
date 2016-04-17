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

def new 


end

def create
  new_product = Product.new(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
  new_product.save
  redirect_to "/products"
end

def edit
  @products = Product.find_by(id: params[:id])
end

def update
  @products = Product.find_by(id: params[:id])
  @products.name = params[:name]
  @products.price = params[:price]
  @products.image = params[:image]
  @products.description = params[:description]
   @products.save
   flash[:success] = "Recipe updated!"
   redirect_to "/products/#{@products.id}"
 end

  def destroy
   @products = Product.find_by(id: params[:id])
   @products.destroy
   redirect_to "/products"
  end
end
