module SeedFactories

	def seed_factories
# https://github.com/thoughtbot/factory_bot/issues/683#issuecomment-248977879
		books = create(:books)

		book1 = create(:book1, category: books)
		book2 = create(:book2, category: books)
		book3 = create(:book3, category: books)

		cds = create(:cds)
		
		cd1 = create(:cd1, category: cds)
		cd2 = create(:cd2, category: cds)
		cd3 = create(:cd3, category: cds)

		dvds = create(:dvds)
		
		dvd1 = create(:dvd1, category: dvds)
		dvd2 = create(:dvd2, category: dvds)
		dvd3 = create(:dvd3, category: dvds)

	end	
end