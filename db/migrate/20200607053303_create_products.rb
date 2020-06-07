class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.belongs_to :product_type, foreign_key: true
      t.timestamps
    end
  end
end
