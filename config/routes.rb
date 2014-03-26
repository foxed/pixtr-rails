Pixtr::Application.routes.draw do

  root "homes#show"
  resource :dashboard, only: [:show]

  resources :galleries do 
      member do
        post "vote" => "gallery_votes#create"
        delete "unvote" => "gallery_votes#destroy"
      end

      resources :images, only: [:new, :create] 
  end

  resources :groups, only: [:index, :create, :new, :show] do
    member do 
      post "join" => "group_memberships#create"
      delete "leave" => "group_memberships#destroy"
    end
    member do
      post "vote" => "group_votes#create"
      delete "unvote" => "group_votes#destroy"
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
      post "vote" => "image_votes#create"
      delete "unvote" => "image_votes#destroy"
    end

    resources :comments, only: [:create]
  end
end
