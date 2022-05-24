Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end

  root 'homes#top'
  get '/about' => 'homes#about', as: 'about'

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
    resources :save_datas do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    get 'save_datas/:id/show_image' => 'save_datas#show_image', as: 'show_image'
    get '/index_post' => 'save_datas#index_post', as: 'index_post'
  end

  get 'finder' => "searches#finder"
  get 'user_result' => "searches#user_result"
  get 'post_result' => "searches#post_result"
  # resources :favorites, only: [:create, :destroy]
  # resources :save_datas do
  #   resource :favorites, only: [:create, :destroy]
  #   resources :comments, only: [:create, :destroy]
  # end
  # get 'save_datas/:id/show_image' => 'save_datas#show_image', as: 'show_image'
  # get 'save_datas/:id/index_post' => 'save_datas#index_post', as: 'index_post'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
