require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

    before :each do

      @request.env["devise.mapping"] = Devise.mappings[:user]
      user_full_cart = create(:user_full_cart)
      sign_in user_full_cart

    end  

  describe 'GET #show' do

    it "assigns the requested order to @order" do
      order = create(:order)
      get :show,  params: {id: order.id}
      expect(assigns(:order)).to eq order
    end

    it "creates order" do
      order = create(:order)
      get :show,  params: {id: order.id}
      expect(assigns(:order)).to be_a Order
    end   

    it "renders the :show template" do
      order = create(:order)
      get :show,  params: {id: order.id}
      expect(response).to render_template :show
    end

  end

  describe "GET #new" do

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end  

    it "builds new @order" do
      get :new
      expect(assigns(:order)).to be_a_new Order
    end

  end

  describe "POST #create" do

    it "creates a new Order" do
      expect {
        post :create,  params: {order: attributes_for(:order)}
      }.to change(Order, :count).by(1)
    end

    it "redirects to the created order" do
      post :create,  params: {order: attributes_for(:order)}
      expect(response).to redirect_to(Order.last)
    end

  end

end
