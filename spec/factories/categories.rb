FactoryBot.define do
  factory :category do
    title "MyString"
    discount 0

    factory :category1 do
      title "Category1"
    end

    factory :category2 do
      title "Category2"
    end

    factory :books do
      title "Books"
    end

    factory :cds do
      title "CDs"
    end

    factory :dvds do
      title "DVDs"
    end   

  end
end
