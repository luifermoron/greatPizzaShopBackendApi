# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  description :text
#  address     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Order < ApplicationRecord
end
