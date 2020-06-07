class AddProductToProductProperty < ActiveRecord::Migration[6.0]
  def change
    add_reference :product_properties, :product, null: false, foreign_key: true
  end
end
