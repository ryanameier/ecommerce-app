class ProductsController < ApplicationController
  #def one_product
 # @first_line = Product.first    
 # end
 def index
  sort_choice = params[:sort]
  puts "sort choice?"
  p sort_choice
  if sort_choice == "discount"
     @all_products = Product.where("price < ?", 2)
  elsif sort_choice
    @all_products = Product.order(sort_choice)
  else
  @all_products = Product.all 
 end
end

def show
if params[:id] == "random"
  @find_product = Product.all.sample
else
 @find_product = Product.find_by(id: params[:id]) 
 end
end

def new 


end

def search
 search_term = params[:user_search]
 @products = Product.where('name LIKE ? OR description LIKE ?', "%#{search_term}%", "%#{search_term}%")
 render :index
end

def create
  new_product = Product.new(name: params[:name], price: params[:price],  description: params[:description], stock_level: params[:stock_level], supplier_id: params[:supplier][:supplier_id])
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
  @products.description = params[:description]
  @products.stock_level = params[:stock_level]
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
