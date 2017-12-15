require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do

  describe "PUT #update" do

    it "updates the requested line_item" do
      line_item = create(:line_item)
      patch :update,  params: {id: line_item, line_item: attributes_for(:line_item)}, xhr: true
      expect(assigns(:line_item)).to eq(line_item)
    end

  end  

  describe "DELETE #destroy" do

    it "destroys the requested line_item" do
      line_item = create(:line_item)
      expect {
        delete :destroy, params: {id: line_item.id}, xhr: true
      }.to change(LineItem, :count).by(-1)
    end

  end

end