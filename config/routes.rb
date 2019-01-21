Rails.application.routes.draw do
  devise_for :users
#  get 'events/index'
  resources :events, :only => [:index, :new, :create, :show]

  root to: "home#index"

  get 'events/new'
#  get 'events/create'
  post '/events' => 'events#create'

#  get 'events/show'
  get 'events/:id' => 'events#show'

  resources :tickets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get 'tickets' => 'tickets/index'
  #root :to => "public/index.html"
end
