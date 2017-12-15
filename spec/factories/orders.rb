FactoryBot.define do
  factory :order do
    user
    pay_type "Check"

    factory :full_order do
      after(:create) do |full_order, evaluator|

      	product1 = create(:product, price: 10.0)
      	product2 = create(:product, price: 20.0)

      	full_order.line_items.create product_id: product1.id, quantity: 1
      	full_order.line_items.create product_id: product2.id, quantity: 2

      end
    end
        
  end
end
