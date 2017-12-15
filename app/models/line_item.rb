class LineItem < ApplicationRecord
  belongs_to :cart, :inverse_of => :line_items, optional: true
  belongs_to :order, :inverse_of => :line_items, optional: true
  belongs_to :product, :inverse_of => :line_items

  validates_numericality_of :quantity, only_integer: true, greater_than: 0

end
