class Product < ApplicationRecord
  belongs_to :category
  validates :price, presence: true
  # rails 4 validates :category_id, prensence: true
  before_save :premium_por_defecto 

  #estoy diciendo mostrar todos los productos premium que son verdaderos
  scope :solo_premium, -> { where(premium: true)}

  scope :last_n, -> (n) {limit(n)}

  def premium_por_defecto
  	unless self.premium.present? || self.premium == true
  		self.premium = false
  	end
  end




end


