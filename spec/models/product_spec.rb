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
require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has a valid factory' do
    product = FactoryBot.build(:product)
    expect(product).to be_valid
  end

  describe 'validation' do
    it 'is not valid without ProductType' do
      product = FactoryBot.build(:product, product_type: nil)
      expect(product).not_to be_valid
    end
  end
end
