Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#index"
    namespace :admin do
      root "admin#index"
      devise_for :users, controllers: {registrations: "admin/registrations", sessions: "admin/sessions"}
      resources :users, only: %i(index show)
      resources :admin_customers
      resources :departments
      resources :dish_types
      resources :dishes
      resources :table_manage
      resources :book_tables, only: %i(index edit update)
      resources :orders, only: %i(index show update)
      resources :order_invoices
      resources :restore_delete, only: :show
    end
    get "/account_activations/:id/edit", to: "account_activations#edit", as: "edit_account_activation"
    get "/login", to: "session#new"
    post "/login", to: "session#create"
    delete "/logout", to: "session#destroy"
    delete "/finish", to: "dinner_tables#destroy"
    resources :users
    resources :dishes do
      resources :reviews, except: %i(show index)
    end
    resources :book_tables
    resources :dinner_tables
    resource :cart, only: :show
    resources :order_items
  end
end
