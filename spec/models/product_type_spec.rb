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
require 'rails_helper'

RSpec.describe ProductType, type: :model do
  it 'has a valid factory' do
    product_type = FactoryBot.build(:product_type)
    expect(product_type).to be_valid
  end

  describe 'validation' do
    it 'is not valid without label' do
      product_type = FactoryBot.build(:product_type, label: nil)
      expect(product_type).not_to be_valid
    end
  end
end
