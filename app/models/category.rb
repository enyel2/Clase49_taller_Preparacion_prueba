class Category < ApplicationRecord
	has_many :products, dependent: :destroy

	validate :descuento_valido

	def descuento_valido
		if self.discount < 0 || self.discount > 100
			errors.add(:discount, "El descuento tiene que estar entre 0 - 100")
		end
	end	
end
