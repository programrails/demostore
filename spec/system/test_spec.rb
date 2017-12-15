require 'rails_helper'

RSpec.describe "testing system", type: :system, js: true do

  it "switches products by category" do

    visit root_path

    click_link 'Books'

    expect(page).not_to have_text("Cd1")
    # expect(page).to have_text("Cd2")

    save_and_open_page

  end

  it "main workflow" do

    admin = create(:admin)

    login_as(admin)

    visit root_path

    expect(page).to have_text("Admin area")

    # click_link 'Sign in'

    within first(".tile-container") do
	    fill_in 'add_product_quantity', with: '1'
	    click_button 'Add to Cart'
    end

	within "p#notice" do
	    expect(page).to have_text("The product was added to the cart.")
	end

	within "span.badge-warning" do
	    expect(page).to have_text("1")
	end

	click_link 'Cart'

	expect(page).to have_text("Your cart")

	click_button 'Checkout'

	expect(page).to have_text("New Order")

	select = find("select[name='order[pay_type]']")

	select.find('option[value="Check"]').select_option	

	# save_and_open_screenshot

	expect(select.value).to eq("Check")	

	click_button 'Create Order'

	within "p#notice" do
	    expect(page).to have_text("Order was successfully created.")
	end

	expect(page).to have_text("Your order")

	# byebug

    save_and_open_page    

  end  
  
end
