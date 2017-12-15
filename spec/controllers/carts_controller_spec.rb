require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  describe 'GET #show' do
    it "assigns the requested cart to @cart" do
      cart = create(:cart)
      get :show,  params: {id: cart.id}
      expect(assigns(:cart)).to eq cart
    end

    it "creates cart" do
      cart = create(:cart)
      get :show,  params: {id: cart.id}
      expect(assigns(:cart)).to be_a Cart
    end   

    it "renders the :show template" do
      cart = create(:cart)
      get :show,  params: {id: cart.id}
      expect(response).to render_template :show
    end

    it "responds to JS format when provided in the params" do
      cart = create(:cart)
        get :show,  params: {id: cart.id}, xhr: true
        expect(response.content_type).to eq "text/javascript"
    end
  end

  describe "PUT #update" do

    it "updates the requested cart" do
      cart = create(:cart)
      patch :update,  params: {id: cart, cart: attributes_for(:cart)}
      expect(assigns(:cart)).to eq(cart)
    end

    # it "changes cart attributes" do
    # end

    it "responds to JS format when provided in the params" do
      cart = create(:cart)
      patch :update,  params: {id: cart, cart: attributes_for(:cart)}, xhr: true
      expect(response.content_type).to eq "text/javascript"
    end

    it "check_cart_add_product" do
      product = create(:product)
      cart = create(:cart)
      patch :update,  params: {id: cart, cart: attributes_for(:cart), add_product_id: product.id, add_product_quantity: 1}, xhr: true
      expect(flash.now[:notice]).to eq "The product was added to the cart."
    end

    it "check_clear_cart" do
      product = create(:product)
      cart = create(:cart)
      patch :update,  params: {id: cart, cart: attributes_for(:cart), clear_line_items: true}, xhr: true
      expect(flash.now[:notice]).to eq "Your cart was successfully emptied."
    end

  end

end
  