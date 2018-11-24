Rails.application.routes.draw do

  devise_for :users

  #Nesting the review pages into the movie pages
  resources :movies do
    #Allowing users to search
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
  end

  #Setting the index page as root page
  root'movies#index'
end
