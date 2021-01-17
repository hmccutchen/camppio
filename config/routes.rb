Rails.application.routes.draw do
  root to: 'book#index'
  get 'book/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
