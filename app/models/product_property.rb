# == Schema Information
#
# Table name: product_properties
#
#  id            :integer          not null, primary key
#  label         :string
#  value         :string
#  type_property :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  product_id    :integer          not null
#
class ProductProperty < ApplicationRecord
    belongs_to :product

    CHEESE = "CHEESE".freeze
    SIZE = "SIZE".freeze
    SAUCE = "SAUCE".freeze
    TOPPING = "TOPPING".freeze
end
