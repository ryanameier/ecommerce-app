class Removedproductidandquantity < ActiveRecord::Migration
  def change
  end
  remove_column :orders, :quantity, :integer
  remove_column :orders, :product_id, :integer
end
