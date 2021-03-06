Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#homepage'

  # resources :books
  # resources :books, except: [:destroy]
  # get '/books', to: 'books#index'
  #
  resources :books, :authors

  scope 'users' do
    get 'novo_usuario', to: 'users#new', as: :new_user
    post 'novo_usuario', to: 'users#create'
  end

  scope 'auth' do
    get 'login', to: 'sessions#new', as: :login
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy', as: :logout
  end

  get 'aula_js', to: 'application#aula_js'

  # scope 'authors' do
  #   get '/', to: 'authors#index', as: :authors
  #   get '/new', to: 'authors#new', as: :new_author
  #   get '/:id/edit', to: 'authors#edit', as: :edit_author
  #   get '/:id', to: 'authors#show', as: :show_author
  #   post '/', to: 'authors#create', as: :create_author
  #   patch '/', to: 'authors#update', as: :author
  #   delete '/:id', to: 'authors#destroy', as: :destroy_author
  # end

  # namespace 'books' do
  #   get '/', to: 'books#index'
  # end

end
