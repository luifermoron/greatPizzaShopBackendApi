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
require 'rails_helper'

RSpec.describe ProductType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
