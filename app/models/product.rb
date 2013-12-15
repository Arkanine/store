class Product < ActiveRecord::Base
  has_many :carts

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, :description, :price, :image_url, presence: true
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)$}i,
      message: 'must be a URL for GIF, JPG or PNG image.',
      multiline: true
  }

private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'there are products_line')
      return false
    end
  end

end
