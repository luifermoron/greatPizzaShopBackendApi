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
    has_many :state_orders
    has_many :products, through: :state_orders

    def existsAny?(states)
        self.state_orders.each do |state_order|
            if states.include?(state_order.aasm.current_state)
                return state_order
            end
        end
        return nil
    end
end
