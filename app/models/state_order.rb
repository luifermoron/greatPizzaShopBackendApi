class StateOrder < ApplicationRecord
    belongs_to :product, required: true
    belongs_to :order, required: true
end
