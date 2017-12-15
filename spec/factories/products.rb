FactoryBot.define do
  factory :product do
    title "MyString"
    description "MyText"
    # category nil
    category
    price "10.00"
    salescount 1

    factory :product_category1 do
    	title "ProductCategory1"
    	association :category, factory: :category1
    end

    factory :product_category2 do
    	title "ProductCategory2"
    	association :category, factory: :category2
        price "20.00"
    end

    factory :book1 do
        title "Book1"
        association :category, factory: :books
        price "10.00"

        factory :book2 do
            title "Book2"
            price "20.00"
        end

        factory :book3 do
            title "Book3"
            price "30.00"
        end        
    end

    factory :cd1 do
        title "Cd1"
        association :category, factory: :cds
        price "10.00"

        factory :cd2 do
            title "Cd2"
            price "20.00"
        end

        factory :cd3 do
            title "Cd3"
            price "30.00"
        end        
    end

    factory :dvd1 do
        title "Dvd1"
        association :category, factory: :dvds
        price "10.00"

        factory :dvd2 do
            title "Dvd2"
            price "20.00"
        end

        factory :dvd3 do
            title "Dvd3"
            price "30.00"
        end        
    end     

  end
end
