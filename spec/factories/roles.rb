FactoryBot.define do

	factory :role do
	  
	  factory :admin_role do
	  	name "admin"
	  	title "Администратор"
	  end

	  factory :blocked_role do
	    name "blocked"
	    title "Заблокирован"
	  end

	end

end
