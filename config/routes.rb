Rails.application.routes.draw do
  namespace 'api' do
    resources :users
    resources :reviews
    post '/reviews/check', to:"reviews#check"


    post '/login', to:"auth#login"
    get '/auto_login', to:"auth#auto_login"

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
