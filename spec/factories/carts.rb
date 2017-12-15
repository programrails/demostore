FactoryBot.define do
  factory :cart do
    user nil

    factory :full_cart do
      after(:create) do |full_cart, evaluator|

      	product1 = create(:product, price: 10.0)
      	product2 = create(:product, price: 20.0)

      	full_cart.line_items.create product_id: product1.id, quantity: 1
      	full_cart.line_items.create product_id: product2.id, quantity: 2

      end
    end

  end
end
