Rails.application.routes.draw do
  root to: "pages#home"
  get "pages/about"
  get "pages/terms"

  resources :articles_categories, only: [ :show ]
  resources :articles, only: [ :index, :show ]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
