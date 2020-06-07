class CreateProductOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :product_orders do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :order, foreign_key: true
      t.integer :quantity
      t.timestamps
    end
  end
end
