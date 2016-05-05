class Product < ActiveRecord::Base
   belongs_to :user
   belongs_to :supplier
   has_many :images
   has_many :categorized_products
   has_many :products, through: :categorized_products
   has_many :carted_products
   has_many :orders, through: :carted_products

   validates :name, :description, presence: true
   validates :price, :stock_level, numericality: {only_integer: true, greater_than: 0}
   validates :name, uniqueness: true
   #uniquness doesnt allow for 2 items of the same name
   #validations have to be items in your model or it will break. 


  def sale_message
    if price <= 2
      return "Discount item!"
    elsif price > 2
      return "On sale!"
    end
  end

  def tax
    tax = price * 0.09
    return "#{tax} for tax"
  end

  def subtax
    subtax = 0.09
    return subtax.to_i
  end

  def total
    total = price * 1.09
    return total.to_i
  end

  def stock_message
    if stock_level == nil or stock_level == 0
      return "Item will be back in stock shortly, thank your for your patience"
    elsif stock_level > 1
      return "Item is in stock!"
    else
      return "Error! Stock cannot be negative!"
    end
  end
end

