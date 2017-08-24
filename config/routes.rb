Rails.application.routes.draw do
    root 'application#index'
    resources :users, exclude: [:index]

    resources :dashboards, exclude: [:index]
    get 'dashboard/:id' => 'dashboards#show'
    get 'destroy/:id' => 'shoes#destroy'

    resources :shoes
    post 'shoes' => 'shoes#create'
    get 'shoes/:id/buy' => 'sales#create'

    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
end
