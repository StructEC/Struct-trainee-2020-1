Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#homepage'

  # resources :books
  # resources :books, except: [:destrou]
  # get '/books', to: 'books#index'
  #
  scope 'books' do
    # get '/', to: 'books#index'
    resources :books
  end

  # namespace 'books' do
  #   get '/', to: 'books#index'
  # end

end
