# == Schema Information
#
# Table name: product_types
#
#  id         :integer          not null, primary key
#  label      :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :product_type do
    label { 'BrazilianPizza' }
    value { 'Brazilian Pizza' }
  end
end
