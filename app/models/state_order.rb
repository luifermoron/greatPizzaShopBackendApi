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
class StateOrder < ApplicationRecord
    
    belongs_to :product, required: true
    belongs_to :order, required: true

    include AASM
    aasm column: 'state' do
        state :unverified, initial: true
        state :prepared
        state :baked
        state :cutted
        state :boxed 
        state :delivering
        state :delivered     
        
        event :prepare do
          transitions from: [:unverified], to: :prepared
        end
        event :bake do
          transitions from: [:prepared], to: :baked
        end
        event :cut do
            transitions from: [:baked], to: :cutted
        end
        event :box do
            transitions from: [:baked, :cutted], to: :boxed
        end
        event :deliver do
            transitions from: [:boxed], to: :delivering
        end
        event :finish do
            transitions from: [:boxed, :delivering], to: :delivered
        end
    end
end
