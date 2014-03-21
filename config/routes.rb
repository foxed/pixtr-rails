Pixtr::Application.routes.draw do

  root "homes#show"

  resources :galleries do 
    resources :images, only: [:new, :create] 
  end

  resources :groups, only: [:index, :create, :new, :show] do
    member do 
      post "join" => "group_memberships#create"
      delete "leave" => "group_memberships#destroy"
    end
 end

  resources :users, only: [:index, :show] do
    member do 
      post "follow" => "following_relationships#create"
      delete "unfollow" => "following_relationships#destroy"
    end
  end

  resources :images, except: [:index, :new, :create] do 
    member do
      post "vote" => "votes#create"
      delete "unvote" => "votes#destroy"
    end

    resources :comments, only: [:create]
  end
end
