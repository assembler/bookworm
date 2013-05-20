Bookworm::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords' }

  resources :books do
    resources :readings
  end

  root to: 'books#index'
end
