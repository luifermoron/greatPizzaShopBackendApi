# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  product_type_id :integer
#  created_by_user :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Product < ApplicationRecord
    has_and_belongs_to_many :categories
    has_many :product_properties
    belongs_to :product_type
end
