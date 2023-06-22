Rails.application.routes.draw do
  # get 'category_submissions/create'
  # get 'category_submissions/show'
  # get '/category_submissions/', to: 'category_submissions#index'
  resources :positions
  resources :form_categories
  devise_for :users
  resources :submissions do
    # resources :comments
    member do 
      put "next_approve", to: "submissions#next_approval"
    end
  end
  # resources :category_submissions, only: [:show, :create] 
  # do
  #   get "category_submissions/index", as: "category_submissions"
  #   resources :comments
  # end
  resources :categories do
    resources :category_submissions, only: [:show, :create, :destroy], as: "submissions"
  end
  resources :category_submissions do
    resources :comments
    member do 
      put "next_approve", to: "category_submissions#next_approve"
      put "last_approval", to: "category_submissions#last_approval"
    end
  end
  resources :units
  resources :departments
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end