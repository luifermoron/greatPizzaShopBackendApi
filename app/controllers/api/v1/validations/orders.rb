class Api::V1::Validations::Orders
  include ActiveModel::Validations

  attr_accessor :orders, :address

  validates :orders, presence: true, allow_nil: false
  validates :address, presence: true

  def initialize(params={})
    @orders = params[:orders]
    @address = params[:address]
  end
end
