Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'homes#top'
  get '/about' => 'homes#about', as: 'about'

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :follower, on: :member
  end

  resources :posts
  get 'searches/finder'
  get 'searches/result'
  resources :favorites, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :save_datas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
