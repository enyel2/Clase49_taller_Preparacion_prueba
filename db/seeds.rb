# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#formas de asegurar aún mas
Product.destroy_all
Category.destroy_all

3.times do |u|
	Category.create(name: "Categ #{u}", discount: rand(5..90))
end

abc = Category.all
abc.each_with_index do |category, i|
	category.products.build(name_p: "Elemento #{i}", price: (i)*1000).save
end 

Product.create(name_p: "Producto special_1", price: 3500, category: Category.last)
Product.create(name_p: "Producto special_2", price: 3500, category: Category.second)
Product.create(name_p: "Producto special_3", price: 3500, category: Category.first)

Product.last.destroy

v1 = Product.last
v1.premium = true
v1.save

categorias = Category.all

categorias.each do |categoria|
	categoria.name = categoria.name.upcase
	categoria.save
end

