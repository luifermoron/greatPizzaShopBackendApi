class CreateStateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :state_orders do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :order, foreign_key: true
      t.string :state
      t.timestamps
    end
  end
end
