class Cart < ApplicationRecord
  belongs_to :user, :inverse_of => :cart, optional: true

  has_many :line_items, dependent: :destroy, :inverse_of => :cart

  def add_product add_product_id, add_product_quantity

  	line_item = self.line_items.find_by product_id: add_product_id

  	if line_item

  		line_item.quantity += add_product_quantity.to_i
  		line_item.save!

  	else

  		self.line_items.create product_id: add_product_id, quantity: add_product_quantity
  		
  	end
  end

  def move_cart_content other_cart

    if other_cart && other_cart.try(:line_items) && !other_cart.line_items.empty?

      other_cart.line_items.each do |other_line_item|

        add_product other_line_item.product.id, other_line_item.quantity

      end

      other_cart.line_items.clear

    end

  end

  def total
    line_items.inject(0) {|sum, x| sum += x.product.price * x.quantity }
  end

end
