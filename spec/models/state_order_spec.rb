# == Schema Information
#
# Table name: state_orders
#
#  id         :integer          not null, primary key
#  product_id :integer
#  order_id   :integer
#  state      :string
#  time       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe StateOrder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
