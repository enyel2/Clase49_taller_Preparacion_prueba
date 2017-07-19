class ProductsController < ApplicationController
  def index
  	#con los params entregramos los parametros
  	#primero preguntamos si estamos recibiendo un parametro
  	if params[:search].present? 
  		@productos = Product.where("name_p like ? or price like ?", "%#{params[:search]}%", "%#{params[:price].to_f}%")
  	elsif params[:price].present?
  		#permite encontrarlo solo entregando el valor exacto
		@productos = Product.where(price: params[:price].to_i)
	else  				
		@productos = Product.all
	end
  end
  def index_categoria
  	
  end
end
