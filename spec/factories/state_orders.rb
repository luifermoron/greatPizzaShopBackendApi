# == Schema Information
#
# Table name: state_orders
#
#  id         :integer          not null, primary key
#  product_id :integer
#  order_id   :integer
#  state      :string
#  time       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :state_order do
    
  end
end
