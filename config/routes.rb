Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: redirect('/admin')

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [:index, :show]
      resources :episodes, only: [:index]
    end
  end

  namespace :admin do
    get '/episodes/sync', to: 'episodes#sync'
  end
end
