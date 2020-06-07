# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :category do
    name { 'Pizzas' }
    description { 'Delicious set of pizzas for you' }
  end
end
