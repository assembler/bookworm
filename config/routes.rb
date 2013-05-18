Bookworm::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords' }

  resources :books

  root to: 'books#index'
end
