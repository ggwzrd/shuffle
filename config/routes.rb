Rails.application.routes.draw do
  root "artists#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists do
    resources :songs
  end
end
