Rails.application.routes.draw do
  get 'followings/create'

  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	registrations: 'users/registrations',
  }
  devise_scope :user do
  	get 'users/homepage' => 'users/sessions#homepage'
  end
  get 'users/followings' => 'followings#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
end
