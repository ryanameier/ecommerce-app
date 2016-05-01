class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :user_id
      t.string :product_id
      t.string :quantity
      t.string :subtotal
      t.string :tax
      t.string :total

      t.timestamps null: false
    end
  end
end
