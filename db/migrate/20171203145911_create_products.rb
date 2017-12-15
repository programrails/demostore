class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.belongs_to :category, foreign_key: true
      t.decimal :price, precision: 8, scale: 2
      t.integer :salescount

      t.timestamps
    end
  end
end
