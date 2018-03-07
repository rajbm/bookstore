Rails.application.routes.draw do
  # resources :books
  # resources :authors

  root 'books#index'

  resources :books 
  resources :authors
  get '/books/search/:value', to: 'books#search'
  get '/authors/search/:value', to: 'authors#search'
  get '/author/:id/books', to: 'authors#author_books'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
