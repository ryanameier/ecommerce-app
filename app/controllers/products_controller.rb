class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]


   def index
    if params[:sort]
      @all_products = Product.order(sort_choice)
    elsif params[:category]
      @all_products = Category.find_by(name: params[:category]).products
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
  @product = Product.new
  #have to do this now that the create method has turned into an instance variable
  end

  def search
   search_term = params[:user_search]
   @products = Product.where('name LIKE ? OR description LIKE ?', "%#{search_term}%", "%#{search_term}%")
   render :index
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price],  description: params[:description], stock_level: params[:stock_level], supplier_id: params[:supplier][:supplier_id], user_id: current_user)
    if @product.save 
      flash[:success] = "Product created!"
      redirect_to "/products/#{@product.id}" 
    else
      render :new #sad path
    end
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