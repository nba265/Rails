# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :payments
  resources :payment_details

  root 'products#index'
  resources :products

  # as :user do
  #   get "signin" => "devise/sessions#new"
  #   post "signin" => "devise/sessions#create"
  #   delete "signout" => "devise/sessions#destroy"
  # end

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  Devise.setup do |config|
    # ...
    # When using Devise with Hotwire/Turbo, the http status for error responses
    # and some redirects must match the following. The default in Devise for existing
    # apps is `200 OK` and `302 Found respectively`, but new apps are generated with
    # these new defaults that match Hotwire/Turbo behavior.
    # Note: These might become the new default in future versions of Devise.
    config.responder.error_status = :unprocessable_entity
    config.responder.redirect_status = :see_other
  end
end
