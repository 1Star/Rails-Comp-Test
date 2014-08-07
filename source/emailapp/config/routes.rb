Rails.application.routes.draw do

  post '/homes/invite', to: 'homes#invite'
  get '/homes/complete', to: 'homes#complete'

  resources :users do
    resources :tours
    get 'sign_up', on: :collection
    get 'tour_start', on: :collection
  end

  root to: 'homes#index'
end
