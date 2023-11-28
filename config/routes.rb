Rails.application.routes.draw do
  devise_for :users

  root to: "movies#index"

  # it is possible to provide a star rating

  post   '/ratings/create', to: "ratings#create"
  patch  '/ratings/update', to: "ratings#update"
  delete '/ratings/destroy', to: "ratings#destroy"

  resources :movies do
    collection do
      get :show
      get :show_rated_by_user
      get :sort_movies_by_popularity
      post :set_search_option
    end
  end

  namespace :admin do
    resources :movies, except: %i[index show]
  end

  get "/up/", to: "up#index", as: :up
  get "/up/databases", to: "up#databases", as: :up_databases

  # Sidekiq has a web dashboard which you can enable below. It's turned off by
  # default because you very likely wouldn't want this to be available to
  # everyone in production.
  #
  # Uncomment the 2 lines below to enable the dashboard WITHOUT authentication,
  # but be careful because even anonymous web visitors will be able to see it!
  # require "sidekiq/web"
  # mount Sidekiq::Web => "/sidekiq"
  #
  # If you add Devise to this project and happen to have an admin? attribute
  # on your user you can uncomment the 4 lines below to only allow access to
  # the dashboard if you're an admin. Feel free to adjust things as needed.
  # require "sidekiq/web"
  # authenticate :user, lambda { |u| u.admin? } do
  #   mount Sidekiq::Web => "/sidekiq"
  # end

  # Learn more about this file at: https://guides.rubyonrails.org/routing.html
end