class Product < ApplicationRecord
  belongs_to :category
  validate :price, presence: true
  # rails 4 validates :category_id, prensence: true

  before_save :default_premium 

  def :default_premium
  	unless self.premium.present? || self.premium == true
  		self.premium = false
  	end
  end
end
