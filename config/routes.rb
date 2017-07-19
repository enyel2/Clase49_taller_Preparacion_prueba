Rails.application.routes.draw do
  get  'products/index'
  root 'products#index'
  post 'products/index'
  get  'products/index_categoria'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
