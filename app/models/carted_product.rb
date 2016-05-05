class CartedProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validate :quantity_must_be_less_than_100

  def quantity_must_be_less_than_100
    if quantity && quantity > 99
    errors.add(:quantity,"Hey, you can only buy up to 99 products bruh!")
    end
  end
end 
