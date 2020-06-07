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
require 'rails_helper'

RSpec.describe ProductProperty, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
