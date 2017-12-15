require 'rails_helper'

RSpec.describe LineItem, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "has a valid factory" do
  	line_item = build(:line_item)
    expect(line_item).to be_valid
  end

end
