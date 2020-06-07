# == Schema Information
#
# Table name: product_orders
#
#  id         :integer          not null, primary key
#  product_id :integer
#  order_id   :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ProductOrder < ApplicationRecord
    belongs_to :product, required: true
    belongs_to :order, required: true
end
