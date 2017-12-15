class AddFileToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :file, :string
  end
end
