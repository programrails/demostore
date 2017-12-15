require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "has a valid factory" do
  	product = build(:product)
    expect(product).to be_valid
  end

end
