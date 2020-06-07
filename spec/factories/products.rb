# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  product_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :product do
    name { 'Brazilian Pizza' }
    description { 'Best Pizza' }
    product_type
  end
end
