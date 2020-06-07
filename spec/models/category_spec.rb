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
require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has a valid factory' do
    category = FactoryBot.build(:category)
    expect(category).to be_valid
  end

  describe 'validation' do
    it 'is not valid without name' do
      category = FactoryBot.build(:category, name: nil)
      expect(category).not_to be_valid
    end
  end
end
