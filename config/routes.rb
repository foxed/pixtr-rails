Pixtr::Application.routes.draw do

  root "galleries#index"

  resources :galleries do
    resources :images, only: [:new, :create, :edit, :update]
  end

  resources :images, only: [:show, :edit, :update, :destroy]

end


#resources :galleries, only: [:index, :show, :edit, :update]