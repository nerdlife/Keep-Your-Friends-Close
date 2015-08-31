Rails.application.routes.draw do
  resources :groups do
    member do
      get 'landmark', to: "groups#getlandmark"
      post 'landmark', to: "groups#setlandmark"
      get 'distance', to: "groups#distance"
    end

    resources :users do
      member do
        get 'leave', to: 'groups#leave'
      end
    end
    resources :invitations
    resources :photos
  end

  get '/users/:id/settings', to: 'users#settings'

  get '/users/:id/enabletexting', to: 'users#enabletexting'
  get '/users/:id/enablelocation', to: 'users#enablelocation'

  get '/users/:id/setupphone', to: 'users#setupphone'
  get '/users/:id/savephone', to: 'users#savephone'
  post '/users/:id/savephone', to: 'users#savephone'

  get '/groups/:id/map', to: 'groups#map'
  get '/groups/:id/chat', to: 'groups#chat'
  post '/groups/:id/text', to: 'groups#text'

  resources :invitations
  delete '/groups/:group_id/invitations/:id/accept', to: 'invitations#accept'
  delete '/groups/:group_id/invitations/:id/decline', to: 'invitations#decline'

  root 'welcome#index'

  get 'welcome/index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
