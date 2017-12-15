require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "GET #index" do

    it "returns a success response" do
      expect(response).to be_success
    end

    it "returns all products" do
	  product_category1 = create(:product_category1)
	  product_category2 = create(:product_category2)
      
      get :index
      expect(assigns(:products)).to match_array([product_category1, product_category2])

    end

    it "returns category product" do
	  product_category1 = create(:product_category1)
	  product_category2 = create(:product_category2)

      get :index, params: {category: product_category1.category.id}
      expect(assigns(:products)).to match_array([product_category1])

    end

    it "does not return wrong category product" do
	  product_category1 = create(:product_category1)
	  product_category2 = create(:product_category2)

      get :index, params: {category: product_category1.category.id}
      expect(assigns(:products)).not_to match_array([product_category2])

    end

    it "renders the :index template" do

      get :index
      expect(response).to render_template :index

    end

    it "responds to html by default" do
      get :index
      expect(response.content_type).to eq "text/html"
    end

    it "responds to JS format when provided in the params" do

      get :index, xhr: true
      expect(response.content_type).to eq "text/javascript"

    end

  end

  describe 'GET #show' do
  	it "assigns the requested contact to @product" do
  		product = create(:product)
  		get :show,  params: {id: product.id}
  		expect(assigns(:product)).to eq product
  	end

  	it "creates cart" do
  		product = create(:product)
  		get :show,  params: {id: product.id}
  		expect(assigns(:cart)).to be_a Cart
  	end  	

  	it "renders the :show template" do
  		product = create(:product)
  		get :show,  params: {id: product.id}
  		expect(response).to render_template :show
  	end

    it "responds to JS format when provided in the params" do
    	product = create(:product)
        get :show,  params: {id: product.id}, xhr: true
        expect(response.content_type).to eq "text/javascript"
    end
  end

end
