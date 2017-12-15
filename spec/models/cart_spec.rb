require 'rails_helper'

RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}" 

  it "has a valid factory" do
  	cart = build(:cart)
    expect(cart).to be_valid
  end

  it "add_product" do
  	product = create(:product)
  	cart = create(:cart)

  	expect(cart.line_items.find_by product_id: product.id).to eq nil

  	cart.add_product product.id, 1
    # expect{cart.add_product product.id, 1}.to change(LineItem, :count).by(1)

# http://www.betterspecs.org/#single

    expect(cart.line_items.count).to eq 1

    expect(cart.line_items.first.quantity).to eq 1

    expect(cart.line_items.first.product_id).to eq product.id

    line_item = cart.line_items.find_by product_id: product.id

    expect(line_item).not_to eq nil

    cart.add_product product.id, 1

    expect(cart.line_items.count).to eq 1

    expect(cart.line_items.first.quantity).to eq 2

  end

  it "total" do

  	full_cart = create(:full_cart)

  	expect(full_cart.total).to eq 50.0

  end
  
end if false
