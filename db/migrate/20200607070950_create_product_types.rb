class CreateProductTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_types do |t|
      t.string :label
      t.string :value
      t.belongs_to :product, index: { unique: true }, foreign_key: true
      t.timestamps
    end
  end
end
