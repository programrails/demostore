class Product < ApplicationRecord
  belongs_to :category, :inverse_of => :products

  has_many :line_items, dependent: :destroy, :inverse_of => :product

	mount_uploader :file, FileUploader

	after_destroy :local_remove_file_directory

	def local_remove_file_directory

		remove_file_directory file

	end

  def uploader_name

    uploader_name_helper self

  end
  
end
