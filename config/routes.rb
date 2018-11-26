Rails.application.routes.draw do
  resources :users 
  post 'users/auth', to: 'users#auth'
  get 'users/l/:username/:password', to: 'users#findId'
  post 'users/login', to: 'users#login'
  
  wash_out :wsuser

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
