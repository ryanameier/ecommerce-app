class Changedordermodel < ActiveRecord::Migration
  def change
    change_column :orders, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :orders, :quantity, 'integer USING CAST(quantity AS integer)'
    change_column :orders, :product_id, 'integer USING CAST(product_id AS integer)'
    change_column :orders, :subtotal, 'numeric USING CAST(subtotal AS numeric(8,2))'
    change_column :orders, :tax, 'numeric USING CAST(tax AS numeric(8,2))'
    change_column :orders, :total, 'numeric USING CAST(total AS numeric(8,2))'
  end
end