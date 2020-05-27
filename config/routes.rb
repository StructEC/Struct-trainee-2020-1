Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#homepage'

  # resources :books
  # resources :books, except: [:destroy]
  # get '/books', to: 'books#index'
  #
  scope 'books' do
    get '/', to: 'books#index', as: :books
    get '/new', to: 'books#new', as: :new_book
    get '/:id/edit', to: 'books#edit', as: :edit_book
    get '/:id', to: 'books#show', as: :show_book
    post '/', to: 'books#create', as: :create_book
    patch '/', to: 'books#update', as: :update_book
    delete '/:id', to: 'books#destroy', as: :destroy_book
  end

  # namespace 'books' do
  #   get '/', to: 'books#index'
  # end

end
