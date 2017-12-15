class AddTitleToRoles < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :title, :string
  end
end