class Order < ApplicationRecord

  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  validates :pay_type, inclusion: PAYMENT_TYPES  

  belongs_to :user, :inverse_of => :order

  has_many :line_items, dependent: :destroy, :inverse_of => :order

  def fill_in
  	
  	user.cart.line_items.each do |line_item|

  		line_item.cart_id = nil

  		line_items << line_item

  	end
  end

  def total
    line_items.inject(0) {|sum, x| sum += x.product.price * x.quantity }
  end
    
end
