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
class ProductType < ApplicationRecord
    validates :label, length: {minimum: 1} 
    validates :value, length: {minimum: 1} 
end
