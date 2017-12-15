FactoryBot.define do
  factory :user do
  	name "John"
  	address "123 Direct Lane"
  	email "john@example.com"
  	password "12345678"

  	factory :user1 do
  	  name "Jack"
  	  email "jack@example.com"
    end

  	factory :user2 do
  	  name "Ted"
  	  email "ted@example.com"
    end

    factory :user_full_cart do
      name "Jane"
      email "jane@example.com"
      association :cart, factory: :full_cart
    end

    factory :admin do
      name "Admin"
      email "admin@example.com"
      
      after(:create) do |admin, evaluator|
        create_list(:admin_role, 1, users: [admin])
      end
    end    

  end
end
