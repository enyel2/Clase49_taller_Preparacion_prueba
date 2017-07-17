class Product < ApplicationRecord
  belongs_to :category
  validates :price, presence: true
  # rails 4 validates :category_id, prensence: true
  before_save :premium_por_defecto 

  def premium_por_defecto
  	unless self.premium.present? || self.premium == true
  		self.premium = false
  	end
  end

end


