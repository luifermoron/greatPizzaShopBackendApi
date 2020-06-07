class CreateProductProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :product_properties do |t|
      t.string :label
      t.string :value
      t.string :type_property
      t.timestamps
    end
  end
end
