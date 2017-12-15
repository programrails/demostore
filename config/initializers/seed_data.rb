module SeedData

	def load_image obj

		File.open(File.join(Rails.root + "app/assets/images/#{obj.title.downcase}.jpg")) do |f|
			obj.file.store! f
			obj.save!
		end
	end


	def seed_data

		(return if Rails.env.production?) if ENV['DYNO'].blank? # check Heroku

		unless Rails.env.test?

			LineItem.delete_all
			Order.delete_all
			Cart.delete_all

			Product.delete_all
			Category.delete_all			

			User.destroy_all
			Role.destroy_all

	    end

	    uploaded_images_dir = Rails.root.join( Rails.env.to_s, 'uploads').to_s

# Does not work properly at least under Windows - does nor erase the directory content
	    (FileUtils.remove_dir uploaded_images_dir) if (Dir.exist? uploaded_images_dir)

		# see config/application.rb
		Rails.configuration.roles.each do |key,value|
		  Role.create( name: key, title: value )
		end		

		# http://stackoverflow.com/questions/4316940/create-a-devise-user-from-ruby-console
		admin = User.find_or_create_by(email: "admin@example.com") { |u| u.password = "12345678"}
		admin.add_role :admin
		admin.name = "Admin"
		admin.address = "Admin address"
		# admin.confirm
		admin.save!

		user1 = User.find_or_create_by(email: "client1@example.com") { |u| u.password = "12345678"}
		user1.name = "John"
		user1.address = "John address"
		# admin.confirm
		user1.save!

		user2 = User.find_or_create_by(email: "client2@example.com") { |u| u.password = "12345678" }
		user2.name = "Jack"
		user2.address = "Jack address"
		# admin.confirm
		user2.save!

		["Books", "CDs", "DVDs"].each do |elem|

			Category.find_or_create_by title: elem

		end

		category_id1 = Category.first.id
		category_id2 = Category.second.id
		category_id3 = Category.third.id


		["Book1", "Book2", "Book3"].each_with_index do |elem, index|

			obj = Product.find_or_create_by title: elem, category_id: category_id1, price: 10*(index+1), description: "Description of " + elem

			load_image obj

		end

		["CD1", "CD2", "CD3"].each_with_index do |elem, index|

			obj = Product.find_or_create_by title: elem, category_id: category_id2, price: 10*(index+1), description: "Description of " + elem

			load_image obj

		end

		["DVD1", "DVD2", "DVD3"].each_with_index do |elem, index|

			obj = Product.find_or_create_by title: elem, category_id: category_id3, price: 10*(index+1), description: "Description of " + elem

			load_image obj

		end

	end

end