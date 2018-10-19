Rails.application.routes.draw do
  resources :users 
  get 'users/:username/:password', to: 'users#findId'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
