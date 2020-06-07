# == Schema Information
#
# Table name: product_types
#
#  id         :integer          not null, primary key
#  label      :string
#  value      :string
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryGirl.define do
  factory :product_type do
    
  end
end
