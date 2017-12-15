require 'rails_helper'

RSpec.describe Order, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "total" do

  	full_cart = create(:full_cart)

  	expect(full_cart.total).to eq 50.0

  end

  it "fill_in" do

  	full_cart = create(:full_cart)
  	order = create(:order)

  	order.user.cart = full_cart
  	order.user.save!

  	order.fill_in

  	expect(order.total).to eq 50.0

  end  

end if false
