class Product < ApplicationRecord
  belongs_to :category
  validates :price, presence: true
  # rails 4 validates :category_id, prensence: true
  before_save :premium_por_defecto 

  after_destroy :ultimo_product

  #estoy diciendo mostrar todos los productos premium que son verdaderos
  scope :solo_premium, -> { where(premium: true)}

  #Muestra  los n producto ingresado
  scope :last_n, -> (n) { limit(n) }

  #Metodo que por defecto asigna valores false
  def premium_por_defecto
  	unless self.premium.present? || self.premium == true
  		self.premium = false
  	end
  end

  #al borrar el ultimo producto de una categoria borrar la categoria
  def ultimo_product
  	cats = Category.all
  		cats.each do |n|
  			if n.products.empty?
  				n.destroy
  			end
  		end
  end

  def precio_final
  	@precio_final = self.price - ((self.price * self.category.discount).to_f / 100)
  end

end


