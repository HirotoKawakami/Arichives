Rails.application.routes.draw do

  get 'notifications/:id/link_through' => 'notifications#link_through', as: :link_through
  
  get 'likes/create'

  get 'likes/destroy'

  devise_for :users
  root  'articles#index'
  get '/about' => 'statistic_pages#about'

  resources :users
  resources :articles do
    collection do
      get :more
    end
  end
  resources :photos
  resources :categories, only: [:show]
  resources :likes, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
