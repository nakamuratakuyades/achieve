Rails.application.routes.draw do
  get "posts/index" => "posts#index"
  post "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/confirm" => "posts#confirm"
  post "posts/confirm" => "posts#confirm"

  get "posts/:id" => "posts#show"
  post "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  
  get "/" => "homes#top"
  get "about" => "homes#about"
end
