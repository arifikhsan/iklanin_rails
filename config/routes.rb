# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  mount RailsAdmin::Engine => '/secretroom', as: 'rails_admin'
  devise_for :users
  root to: 'welcome#index'
  namespace :api, defaults: { format: :json } do
    post 'login', to: 'auth#login'
    delete 'logout', to: 'auth#logout'
    post 'register', to: 'auth#register'
    get 'user', to: 'auth#user'
    get 'wakeup', to: 'misc#wakeup'
    namespace :v1 do
      get :ping, to: 'ad#ping'
      get :ads, to: 'ad#all'
    end
  end
end
