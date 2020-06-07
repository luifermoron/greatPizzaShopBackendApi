# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
    has_and_belongs_to_many :categories
    has_many :product_properties
    has_one :product_type, required: true
end
