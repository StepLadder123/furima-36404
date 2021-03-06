Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  get 'furima-36404.herokuapp.com', to: redirect('www.yahoo.co.jp', status: 301)
  resources :items do
    resources :purchases, only: [:index, :create]
    collection do
      get 'search'
      get 'search_result'
    end
    resources :comments, only: :create
  end
end
