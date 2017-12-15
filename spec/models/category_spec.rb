require 'rails_helper'

RSpec.describe Category, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "has a valid factory" do
  	category = build(:category)
    expect(category).to be_valid
  end

end
